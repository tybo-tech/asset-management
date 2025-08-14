/* =========================
   PHASE 2 STOCK RENAMING (UP)
   Safe phpMyAdmin edition
   ========================= */

SET @old_sql_mode = @@sql_mode;
SET sql_mode = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ZERO_DATE,NO_ZERO_IN_DATE,NO_ENGINE_SUBSTITUTION';
SET FOREIGN_KEY_CHECKS = 0;

START TRANSACTION;

-- 0) If an old compatibility view exists from prior attempts, drop it
DROP VIEW IF EXISTS `Asset`;

-- 1) Rename Asset -> StockItem
RENAME TABLE `Asset` TO `StockItem`;

-- 2) Rename column assetTypeId -> stockTypeId
ALTER TABLE `StockItem`
  CHANGE COLUMN `assetTypeId` `stockTypeId` INT NOT NULL;

-- 3) Create StockType (duplicate of AssetType) if not present
CREATE TABLE IF NOT EXISTS `StockType` LIKE `AssetType`;

-- If StockType is empty, copy rows from AssetType
INSERT INTO `StockType`
SELECT * FROM `AssetType`
WHERE NOT EXISTS (SELECT 1 FROM `StockType` LIMIT 1);

-- 4) Transactions: add stockItemId, backfill, drop assetId
ALTER TABLE `Transactions`
  ADD COLUMN `stockItemId` INT NULL AFTER `assetId`;

UPDATE `Transactions`
SET `stockItemId` = `assetId`
WHERE `stockItemId` IS NULL;

ALTER TABLE `Transactions`
  DROP COLUMN `assetId`;

-- 5) Back-compat VIEW named Asset for older code paths
CREATE OR REPLACE VIEW `Asset` AS
SELECT
  si.`id`,
  si.`code`,
  si.`name`,
  si.`categoryId`,
  si.`stockTypeId`    AS `assetTypeId`,
  si.`imageUrl`,
  si.`slug`,
  si.`status`,
  si.`createdDate`,
  si.`createdBy`,
  si.`lastUpdatedDate`,
  si.`lastUpdatedBy`,
  si.`stockInHand`,
  si.`metadata`,
  si.`size`
FROM `StockItem` si;

COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
SET sql_mode = @old_sql_mode;


ALTER TABLE `asset_types` ADD `asset_code` VARCHAR(20) NULL DEFAULT NULL AFTER `name`;
