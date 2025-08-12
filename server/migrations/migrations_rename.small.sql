/* ============================================================
   Phase 2 – Clean Stock Cutover (NO legacy Asset kept)
   MySQL 8 / phpMyAdmin friendly
   ============================================================ */
SET @old_sql_mode = @@sql_mode;
SET sql_mode = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ZERO_DATE,NO_ZERO_IN_DATE,NO_ENGINE_SUBSTITUTION';
SET FOREIGN_KEY_CHECKS = 0;

START TRANSACTION;

/* ------------------------------------------------------------
   0) If Asset is a VIEW: drop it.
   ------------------------------------------------------------ */
DROP VIEW IF EXISTS `Asset`;

/* ------------------------------------------------------------
   1) If Asset is still a BASE TABLE, convert it to StockItem
      (only if StockItem doesn’t already exist).
   ------------------------------------------------------------ */
SET @asset_is_table := (
  SELECT COUNT(*) FROM information_schema.tables
  WHERE table_schema = DATABASE() AND table_name='Asset' AND table_type='BASE TABLE'
);
SET @stockitem_exists := (
  SELECT COUNT(*) FROM information_schema.tables
  WHERE table_schema = DATABASE() AND table_name='StockItem'
);

-- Case A: Asset is a table and StockItem doesn't exist → rename
SET @sql := IF(@asset_is_table=1 AND @stockitem_exists=0,
  'RENAME TABLE `Asset` TO `StockItem`',
  'SELECT "No table rename needed"');
PREPARE s FROM @sql; EXECUTE s; DEALLOCATE PREPARE s;

-- Case B: Both exist (rare). If you want to merge data, uncomment:
-- INSERT INTO `StockItem` (id,code,name,categoryId,stockTypeId,imageUrl,slug,status,createdDate,createdBy,lastUpdatedDate,lastUpdatedBy,stockInHand,metadata,size)
-- SELECT id,code,name,categoryId,assetTypeId,imageUrl,slug,status,createdDate,createdBy,lastUpdatedDate,lastUpdatedBy,stockInHand,metadata,size
-- FROM `Asset`;
-- DROP TABLE `Asset`;

/* ------------------------------------------------------------
   2) Ensure StockItem column name is stockTypeId (not assetTypeId).
   ------------------------------------------------------------ */
SET @has_assetTypeId := (
  SELECT COUNT(*) FROM information_schema.COLUMNS
  WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME='StockItem' AND COLUMN_NAME='assetTypeId'
);
SET @sql := IF(@has_assetTypeId=1,
  'ALTER TABLE `StockItem` CHANGE COLUMN `assetTypeId` `stockTypeId` INT NOT NULL',
  'SELECT "Column rename not required"');
PREPARE s FROM @sql; EXECUTE s; DEALLOCATE PREPARE s;

/* ------------------------------------------------------------
   3) Ensure StockType exists. If missing, clone from AssetType.
   (Keeps your types; no dropping.)
   ------------------------------------------------------------ */
SET @has_stocktype := (
  SELECT COUNT(*) FROM information_schema.tables
  WHERE table_schema = DATABASE() AND table_name='StockType'
);
SET @has_assettype := (
  SELECT COUNT(*) FROM information_schema.tables
  WHERE table_schema = DATABASE() AND table_name='AssetType'
);

-- Create StockType if absent (copy structure from AssetType)
SET @sql := IF(@has_stocktype=0 AND @has_assettype=1,
  'CREATE TABLE `StockType` LIKE `AssetType`',
  'SELECT "StockType exists or AssetType missing; skipping create"');
PREPARE s FROM @sql; EXECUTE s; DEALLOCATE PREPARE s;

-- Seed StockType if it was just created (and is empty)
SET @stocktype_is_empty := IFNULL((SELECT COUNT(*)=0 FROM `StockType`), 0);
SET @sql := IF(@has_stocktype=0 AND @has_assettype=1 AND @stocktype_is_empty=1,
  'INSERT INTO `StockType` SELECT * FROM `AssetType`',
  'SELECT "No StockType seeding needed"');
PREPARE s FROM @sql; EXECUTE s; DEALLOCATE PREPARE s;

/* ------------------------------------------------------------
   4) Normalize Transactions: keep only stockItemId.
   ------------------------------------------------------------ */
-- Add column if missing
SET @has_stockItemId := (
  SELECT COUNT(*) FROM information_schema.COLUMNS
  WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME='Transactions' AND COLUMN_NAME='stockItemId'
);
SET @sql := IF(@has_stockItemId=0,
  'ALTER TABLE `Transactions` ADD COLUMN `stockItemId` INT NULL AFTER `assetId`',
  'SELECT "stockItemId already present"');
PREPARE s FROM @sql; EXECUTE s; DEALLOCATE PREPARE s;

-- Backfill from assetId if assetId exists
SET @has_assetId := (
  SELECT COUNT(*) FROM information_schema.COLUMNS
  WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME='Transactions' AND COLUMN_NAME='assetId'
);
SET @sql := IF(@has_assetId=1,
  'UPDATE `Transactions` SET `stockItemId` = `assetId` WHERE `stockItemId` IS NULL',
  'SELECT "assetId not found; no backfill"');
PREPARE s FROM @sql; EXECUTE s; DEALLOCATE PREPARE s;

-- Drop assetId if it still exists
SET @sql := IF(@has_assetId=1,
  'ALTER TABLE `Transactions` DROP COLUMN `assetId`',
  'SELECT "assetId already dropped"');
PREPARE s FROM @sql; EXECUTE s; DEALLOCATE PREPARE s;

/* ------------------------------------------------------------
   5) (Optional) Add/refresh FK indexes (no-op if they exist already).
   ------------------------------------------------------------ */
-- Index for transactions
ALTER TABLE `Transactions` ADD INDEX `idx_trans_stockItemId` (`stockItemId`);

-- (Optional) FK examples; uncomment if you maintain FKs
-- ALTER TABLE `StockItem`
--   ADD INDEX `idx_stockitem_stocktype` (`stockTypeId`);
-- ALTER TABLE `StockItem`
--   ADD CONSTRAINT `fk_stockitem_stocktype`
--   FOREIGN KEY (`stockTypeId`) REFERENCES `StockType`(`id`)
--   ON DELETE RESTRICT ON UPDATE CASCADE;

COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
SET sql_mode = @old_sql_mode;
