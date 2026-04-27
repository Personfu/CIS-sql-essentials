-- PersonFu-Final: add_zip_index_my_guitar_shop.sql
USE my_guitar_shop;

ALTER TABLE Customers
  ADD INDEX idx_customers_zip_code (zip_code);
