-- 01 Data Cleaning

-- Convert blanks to NULL
UPDATE ecommerce_dataset
SET OrderAmountHikeFromlastYear=
NULLIF(TRIM(OrderAmountHikeFromlastYear),''),
CouponUsed=NULLIF(TRIM(CouponUsed),''),
OrderCount=NULLIF(TRIM(OrderCount),''),
DaySinceLastOrder=NULLIF(TRIM(DaySinceLastOrder),''),
Tenure=NULLIF(TRIM(Tenure),''),
WarehouseToHome=NULLIF(TRIM(WarehouseToHome),''),
HourSpendOnApp=NULLIF(TRIM(HourSpendOnApp),'');

-- Convert columns to INT
ALTER TABLE ecommerce_dataset 
MODIFY COLUMN Tenure INT,
MODIFY COLUMN WarehouseToHome INT,
MODIFY COLUMN HourSpendOnApp INT,
MODIFY COLUMN OrderAmountHikeFromlastYear INT,
MODIFY COLUMN CouponUsed INT,
MODIFY COLUMN OrderCount INT,
MODIFY COLUMN DaySinceLastOrder INT;

-- Fill NULLs using averages
UPDATE ecommerce_dataset 
SET Tenure=
COALESCE(Tenure,(SELECT ROUND(AVG(Tenure),0) 
FROM (SELECT * FROM ecommerce_dataset)t));

UPDATE ecommerce_dataset 
SET WarehouseToHome=COALESCE(WarehouseToHome,(SELECT ROUND(AVG(WarehouseToHome),0) FROM (SELECT * FROM ecommerce_dataset)t));

UPDATE ecommerce_dataset 
SET HourSpendOnApp=COALESCE(HourSpendOnApp,(SELECT ROUND(AVG(HourSpendOnApp),0) FROM (SELECT * FROM ecommerce_dataset)t));

UPDATE ecommerce_dataset 
SET OrderAmountHikeFromlastYear=COALESCE(OrderAmountHikeFromlastYear,(SELECT ROUND(AVG(OrderAmountHikeFromlastYear),0) FROM (SELECT * FROM ecommerce_dataset)t));

UPDATE ecommerce_dataset 
SET CouponUsed=COALESCE(CouponUsed,(SELECT ROUND(AVG(CouponUsed),0) FROM (SELECT * FROM ecommerce_dataset)t));

UPDATE ecommerce_dataset 
SET OrderCount=COALESCE(OrderCount,(SELECT ROUND(AVG(OrderCount),0) FROM (SELECT * FROM ecommerce_dataset)t));

UPDATE ecommerce_dataset 
SET DaySinceLastOrder=COALESCE(DaySinceLastOrder,(SELECT ROUND(AVG(DaySinceLastOrder),0) FROM (SELECT * FROM ecommerce_dataset)t));

-- Standardize categories
UPDATE ecommerce_dataset 
SET PreferredLoginDevice='Mobile Phone' 
WHERE PreferredLoginDevice='Phone';

UPDATE ecommerce_dataset 
SET PreferredPaymentMode='Credit Card' 
WHERE PreferredPaymentMode='CC';

UPDATE ecommerce_dataset 
SET PreferredPaymentMode='Cash on Delivery' 
WHERE PreferredPaymentMode='COD';

UPDATE ecommerce_dataset 
SET PreferedOrderCat='Mobile Phone' WHERE PreferedOrderCat='Mobile';

-- Fix outliers
UPDATE ecommerce_dataset 
SET WarehouseToHome=27 WHERE WarehouseToHome=127;

UPDATE ecommerce_dataset 
SET WarehouseToHome=26 WHERE WarehouseToHome=126;
