-- Disable FKs for safe drop
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS asset_item_transfers;
DROP TABLE IF EXISTS asset_items;
DROP TABLE IF EXISTS asset_transfers;
DROP TABLE IF EXISTS asset_locations;
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS asset_types;
DROP TABLE IF EXISTS asset_categories;

SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

-- Asset categories (separate from stock categories)
CREATE TABLE asset_categories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  description VARCHAR(255),
  is_active TINYINT(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Locations (typed)
CREATE TABLE locations (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  building VARCHAR(255),
  floor VARCHAR(100),
  type ENUM('Store','Room','Maintenance','Disposal') NOT NULL DEFAULT 'Room',
  metadata JSON,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Asset types (parent)
CREATE TABLE asset_types (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  asset_category_id INT NULL,
  description TEXT,
  default_cost DECIMAL(12,2) NULL,
  metadata JSON,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_assettypes_category FOREIGN KEY (asset_category_id) REFERENCES asset_categories(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Bulk location counts (keep if you’ll also use stock-like flows)
CREATE TABLE asset_locations (
  id INT AUTO_INCREMENT PRIMARY KEY,
  asset_type_id INT NOT NULL,
  location_id INT NOT NULL,
  quantity INT NOT NULL DEFAULT 0,
  last_updated DATETIME DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY uq_asset_location (asset_type_id, location_id),
  CONSTRAINT fk_assetloc_type FOREIGN KEY (asset_type_id) REFERENCES asset_types(id) ON DELETE CASCADE,
  CONSTRAINT fk_assetloc_location FOREIGN KEY (location_id) REFERENCES locations(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Bulk transfers (stock-like)
CREATE TABLE asset_transfers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  asset_type_id INT NOT NULL,
  from_location_id INT NULL,
  to_location_id INT NOT NULL,
  quantity INT NOT NULL DEFAULT 1,
  reason VARCHAR(255),
  date DATETIME DEFAULT CURRENT_TIMESTAMP,
  done_by INT,
  metadata JSON,
  CONSTRAINT fk_trans_type FOREIGN KEY (asset_type_id) REFERENCES asset_types(id) ON DELETE CASCADE,
  CONSTRAINT fk_trans_fromloc FOREIGN KEY (from_location_id) REFERENCES locations(id) ON DELETE SET NULL,
  CONSTRAINT fk_trans_toloc FOREIGN KEY (to_location_id) REFERENCES locations(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Serialized items (child records)
CREATE TABLE asset_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  asset_type_id INT NOT NULL,
  asset_code VARCHAR(100) NOT NULL UNIQUE,
  serial_number VARCHAR(255) DEFAULT NULL,
  condition_label VARCHAR(50) DEFAULT NULL,      -- <- renamed to avoid reserved word
  warranty_expiry DATE DEFAULT NULL,
  status ENUM('Active','In Maintenance','Disposed') DEFAULT 'Active',
  current_location_id INT DEFAULT NULL,
  metadata JSON DEFAULT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_items_type FOREIGN KEY (asset_type_id) REFERENCES asset_types(id) ON DELETE CASCADE,
  CONSTRAINT fk_items_location FOREIGN KEY (current_location_id) REFERENCES locations(id) ON DELETE SET NULL,
  CONSTRAINT uq_assettype_serial UNIQUE (asset_type_id, serial_number)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE INDEX idx_items_status_loc ON asset_items (status, current_location_id);
CREATE INDEX idx_items_warranty ON asset_items (warranty_expiry);

-- Item transfer history
CREATE TABLE asset_item_transfers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  asset_item_id INT NOT NULL,
  from_location_id INT DEFAULT NULL,
  to_location_id INT NOT NULL,
  reason VARCHAR(255),
  date DATETIME DEFAULT CURRENT_TIMESTAMP,
  done_by INT DEFAULT NULL,
  metadata JSON DEFAULT NULL,
  CONSTRAINT fk_itemtrans_item FOREIGN KEY (asset_item_id) REFERENCES asset_items(id) ON DELETE CASCADE,
  CONSTRAINT fk_itemtrans_fromloc FOREIGN KEY (from_location_id) REFERENCES locations(id) ON DELETE SET NULL,
  CONSTRAINT fk_itemtrans_toloc FOREIGN KEY (to_location_id) REFERENCES locations(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- Out of scope at the moment
DROP TABLE IF EXISTS asset_transfers;
DROP TABLE IF EXISTS asset_locations;





-- =========================================
-- SEED: minimal data to test the flows
-- =========================================

-- Asset categories
INSERT INTO asset_categories (name, description) VALUES
  ('Electronics','TVs, fridges, kettles'),
  ('Furniture','Beds, chairs, tables');

-- Locations (typed)
INSERT INTO locations (name, building, floor, type) VALUES
  ('Main Store', 'Central Depot', 'G', 'Store'),
  ('Room 101', 'Block A', '1', 'Room'),
  ('Maintenance Bay', 'Workshop', 'G', 'Maintenance'),
  ('Disposal Yard', 'Back Lot', 'G', 'Disposal');

-- Look up ids we’ll need
SELECT id, name, type FROM locations;
SELECT id, name FROM asset_categories;

-- Asset type (parent)
INSERT INTO asset_types (name, asset_category_id, description, default_cost)
VALUES ('Samsung 40\" LED TV', (SELECT id FROM asset_categories WHERE name='Electronics'), '40-inch LED TV', 4500.00);

-- Serialized items (children) land in STORE first (GRV -> Store)
INSERT INTO asset_items (asset_type_id, asset_code, serial_number, condition_label, warranty_expiry, status, current_location_id)
VALUES
  ((SELECT id FROM asset_types WHERE name='Samsung 40\" LED TV'), 'TV-001', 'A1B2C3', 'New', DATE_ADD(CURDATE(), INTERVAL 365 DAY), 'Active',
   (SELECT id FROM locations WHERE name='Main Store')),
  ((SELECT id FROM asset_types WHERE name='Samsung 40\" LED TV'), 'TV-002', 'D4E5F6', 'New', DATE_ADD(CURDATE(), INTERVAL 365 DAY), 'Active',
   (SELECT id FROM locations WHERE name='Main Store'));

-- =========================================
-- MOVE: Store -> Room 101 (initial assignment)
-- (1) history row, (2) update current_location on the item
-- =========================================
-- TV-001
INSERT INTO asset_item_transfers (asset_item_id, from_location_id, to_location_id, reason)
SELECT ai.id, l_from.id, l_to.id, 'Initial room assignment'
FROM asset_items ai
JOIN locations l_from ON l_from.name='Main Store'
JOIN locations l_to   ON l_to.name='Room 101'
WHERE ai.asset_code='TV-001';

UPDATE asset_items ai
JOIN locations l_to ON l_to.name='Room 101'
SET ai.current_location_id = l_to.id
WHERE ai.asset_code='TV-001';

-- =========================================
-- MAINTENANCE: Room -> Maintenance Bay (flag In Maintenance)
-- =========================================
INSERT INTO asset_item_transfers (asset_item_id, from_location_id, to_location_id, reason)
SELECT ai.id, l_from.id, l_to.id, 'Screen issue'
FROM asset_items ai
JOIN locations l_from ON l_from.name='Room 101'
JOIN locations l_to   ON l_to.name='Maintenance Bay'
WHERE ai.asset_code='TV-001';

UPDATE asset_items ai
JOIN locations l_to ON l_to.name='Maintenance Bay'
SET ai.current_location_id = l_to.id,
    ai.status = 'In Maintenance'
WHERE ai.asset_code='TV-001';

-- =========================================
-- COMPLETE MAINTENANCE: back to Room 101, set Active
-- =========================================
INSERT INTO asset_item_transfers (asset_item_id, from_location_id, to_location_id, reason)
SELECT ai.id, l_from.id, l_to.id, 'Maintenance complete'
FROM asset_items ai
JOIN locations l_from ON l_from.name='Maintenance Bay'
JOIN locations l_to   ON l_to.name='Room 101'
WHERE ai.asset_code='TV-001';

UPDATE asset_items ai
JOIN locations l_to ON l_to.name='Room 101'
SET ai.current_location_id = l_to.id,
    ai.status = 'Active'
WHERE ai.asset_code='TV-001';

-- =========================================
-- DISPOSAL: Room -> Disposal Yard (mark Disposed)
-- =========================================
INSERT INTO asset_item_transfers (asset_item_id, from_location_id, to_location_id, reason)
SELECT ai.id, l_from.id, l_to.id, 'End of life - damaged'
FROM asset_items ai
JOIN locations l_from ON l_from.name='Room 101'
JOIN locations l_to   ON l_to.name='Disposal Yard'
WHERE ai.asset_code='TV-002';

UPDATE asset_items ai
JOIN locations l_to ON l_to.name='Disposal Yard'
SET ai.current_location_id = l_to.id,
    ai.status = 'Disposed'
WHERE ai.asset_code='TV-002';

-- =========================================
-- Helpful view: counts per location by type (ignores Disposed)
-- =========================================
CREATE OR REPLACE VIEW asset_location_agg AS
SELECT
  ai.asset_type_id,
  ai.current_location_id AS location_id,
  COUNT(*) AS quantity
FROM asset_items ai
WHERE ai.status <> 'Disposed'
GROUP BY ai.asset_type_id, ai.current_location_id;

-- Quick checks
SELECT * FROM asset_items ORDER BY asset_code;
SELECT * FROM asset_item_transfers ORDER BY date, id;
SELECT ala.*, at.name AS asset_type, l.name AS location
FROM asset_location_agg ala
JOIN asset_types at ON at.id=ala.asset_type_id
JOIN locations l ON l.id=ala.location_id
ORDER BY asset_type, location;
