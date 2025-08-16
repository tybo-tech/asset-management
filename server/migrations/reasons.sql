CREATE TABLE IF NOT EXISTS reasons (
  id            INT NOT NULL AUTO_INCREMENT,
  tenant_id     INT NOT NULL,
  reason_type   VARCHAR(64)  NOT NULL,          -- e.g. 'stock_management', 'asset_movement'
  name          VARCHAR(255) NOT NULL,          -- label AND value for FE if you like
  description   TEXT NULL,
  sort_order    INT NOT NULL DEFAULT 0,
  active        TINYINT(1) NOT NULL DEFAULT 1,
  metadata      JSON NULL,
  created_by    INT NULL,
  updated_by    INT NULL,
  created_at    DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at    DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY uq_reason_unique (tenant_id, reason_type, name),
  KEY idx_reason_type (tenant_id, reason_type, active, sort_order),
  CONSTRAINT fk_reasons_tenant FOREIGN KEY (tenant_id)
    REFERENCES tenants(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ---------------------------------
-- 3) Seed: STOCK MANAGEMENT reasons
-- ---------------------------------
INSERT INTO reasons (tenant_id, reason_type, name, description, sort_order, active)
VALUES
  (1, 'stock_management', 'Replacement (Broken)',            NULL,  10, 1),
  (1, 'stock_management', 'Replacement (Damaged)',           NULL,  20, 1),
  (1, 'stock_management', 'Replacement (Stolen)',            NULL,  30, 1),
  (1, 'stock_management', 'New Allocation',                  NULL,  40, 1),
  (1, 'stock_management', 'Reversal of duplication',         NULL,  50, 1),
  (1, 'stock_management', 'Reversal of stock adjustment',    NULL,  60, 1),
  (1, 'stock_management', 'Reversal of stock take',          NULL,  70, 1),
  (1, 'stock_management', 'Reversal due to error',           NULL,  80, 1),
  (1, 'stock_management', 'Other',               'Generic catch-all',  999, 1)
ON DUPLICATE KEY UPDATE
  description=VALUES(description),
  sort_order=VALUES(sort_order),
  active=VALUES(active);

-- ---------------------------------
-- 4) Seed: ASSET MOVEMENT reasons
-- ---------------------------------
INSERT INTO reasons (tenant_id, reason_type, name, description, sort_order, active)
VALUES
  (1, 'asset_movement', 'Initial room assignment',             NULL,  10, 1),
  (1, 'asset_movement', 'Room change',                         NULL,  20, 1),
  (1, 'asset_movement', 'Relocation (same building)',          NULL,  30, 1),
  (1, 'asset_movement', 'Relocation (different site)',         NULL,  40, 1),
  (1, 'asset_movement', 'Move to storage',          'Temporarily stored',  50, 1),
  (1, 'asset_movement', 'Sent to maintenance',      'Moved to maintenance bay/vendor',  60, 1),
  (1, 'asset_movement', 'Maintenance complete',     'Returned to service',  70, 1),
  (1, 'asset_movement', 'Temporary relocation (event)',        'Short-term move for an event',  80, 1),
  (1, 'asset_movement', 'Loaned out',               'Issued to user/team temporarily',  90, 1),
  (1, 'asset_movement', 'Loan returned',                        NULL, 100, 1),
  (1, 'asset_movement', 'Swap with another item',   'Exchange between locations', 110, 1),
  (1, 'asset_movement', 'Audit reconciliation move','Correcting audit variance', 120, 1),
  (1, 'asset_movement', 'Correction: previous error','Fixing wrong location entry', 130, 1),
  (1, 'asset_movement', 'Security relocation',      'Moved for safety/security reasons', 140, 1),
  (1, 'asset_movement', 'Other',                    'Generic catch-all', 999, 1)
ON DUPLICATE KEY UPDATE
  description=VALUES(description),
  sort_order=VALUES(sort_order),
  active=VALUES(active);

COMMIT;
