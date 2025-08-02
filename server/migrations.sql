CREATE TABLE `asset_types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `category` VARCHAR(100),
  `description` TEXT,
  `default_value` DECIMAL(12,2),
  `total_quantity` INT DEFAULT 0,
  `metadata` JSON,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

CREATE TABLE `locations` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `building` VARCHAR(255),
  `floor` VARCHAR(100),
  `metadata` JSON,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);


CREATE TABLE `asset_locations` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `asset_type_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  `quantity` INT NOT NULL DEFAULT 0,
  `last_updated` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_asset_location` (`asset_type_id`, `location_id`),
  FOREIGN KEY (`asset_type_id`) REFERENCES `asset_types`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`location_id`) REFERENCES `locations`(`id`) ON DELETE CASCADE
);






CREATE TABLE `asset_transfers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `asset_type_id` INT NOT NULL,
  `from_location_id` INT,
  `to_location_id` INT NOT NULL,
  `quantity` INT NOT NULL DEFAULT 1,
  `reason` VARCHAR(255),
  `date` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `done_by` INT,
  `metadata` JSON,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`asset_type_id`) REFERENCES `asset_types`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`from_location_id`) REFERENCES `locations`(`id`) ON DELETE SET NULL,
  FOREIGN KEY (`to_location_id`) REFERENCES `locations`(`id`) ON DELETE CASCADE
);


CREATE TABLE `asset_items` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `asset_type_id` INT NOT NULL,
  `asset_code` VARCHAR(100) UNIQUE NOT NULL,
  `serial_number` VARCHAR(255) DEFAULT NULL,
  `condition` VARCHAR(50) DEFAULT NULL,
  `warranty_expiry` DATE DEFAULT NULL,
  `status` ENUM('Active', 'In Maintenance', 'Disposed') DEFAULT 'Active',
  `current_location_id` INT DEFAULT NULL,
  `metadata` JSON DEFAULT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`asset_type_id`) REFERENCES `asset_types`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`current_location_id`) REFERENCES `locations`(`id`) ON DELETE SET NULL
);


CREATE TABLE `asset_item_transfers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `asset_item_id` INT NOT NULL,
  `from_location_id` INT DEFAULT NULL,
  `to_location_id` INT NOT NULL,
  `reason` VARCHAR(255),
  `date` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `done_by` INT DEFAULT NULL,
  `metadata` JSON DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`asset_item_id`) REFERENCES `asset_items`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`from_location_id`) REFERENCES `locations`(`id`) ON DELETE SET NULL,
  FOREIGN KEY (`to_location_id`) REFERENCES `locations`(`id`) ON DELETE CASCADE
);
