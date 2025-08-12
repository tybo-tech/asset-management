-- Migration script: Asset ➜ StockItem, AssetType ➜ StockType, Transactions ➜ StockTransactions
-- Run in a maintenance window. Test in staging first!

START TRANSACTION;

-- 1) Rename the stock table
RENAME TABLE `Asset` TO `StockItem`;

-- 2) Update column names (keeps semantics the same)
ALTER TABLE `StockItem`
  CHANGE COLUMN `assetTypeId` `stockTypeId` INT NOT NULL;

-- 3) Duplicate type table for stock (safer for future asset module)
CREATE TABLE `StockType` LIKE `AssetType`;
INSERT INTO `StockType` SELECT * FROM `AssetType`;

-- 4) Fix FKs (adapt names to your constraint names)
-- Example:
-- ALTER TABLE `StockItem` DROP FOREIGN KEY fk_asset_assetType;
-- ALTER TABLE `StockItem` ADD CONSTRAINT fk_stockitem_stocktype
--   FOREIGN KEY (`stockTypeId`) REFERENCES `StockType`(`id`);

-- 5) Transactions to use stock naming
ALTER TABLE `Transactions`
  ADD COLUMN `stockItemId` INT NULL AFTER `assetId`;

UPDATE `Transactions` t
SET t.stockItemId = t.assetId;

ALTER TABLE `Transactions`
  DROP COLUMN `assetId`;

-- Optional: rename table for clarity
-- RENAME TABLE `Transactions` TO `StockTransactions`;

COMMIT;

-- Fallback: create a VIEW for legacy code if needed
-- CREATE VIEW Asset AS SELECT *, stockTypeId AS assetTypeId FROM StockItem;
