-- 02 Feature Engineering
ALTER TABLE ecommerce_dataset 
ADD COLUMN CustomerStatus VARCHAR(50);

UPDATE ecommerce_dataset 
SET CustomerStatus=
CASE 
WHEN Churn=1 THEN 'Churned' 
WHEN Churn=0 THEN 'Stayed' 
END;

ALTER TABLE ecommerce_dataset 
ADD COLUMN ComplainRecieved VARCHAR(50);

UPDATE ecommerce_dataset 
SET ComplainRecieved=
CASE 
WHEN Complain=1 THEN 'Yes' 
WHEN Complain=0 THEN 'No' 
END;

ALTER TABLE ecommerce_dataset 
ADD COLUMN WarehouseToHomeRange VARCHAR(50);

UPDATE ecommerce_dataset 
SET WarehouseToHomeRange=
CASE 
WHEN WarehouseToHome<=10 THEN 'Very close distance' 
WHEN WarehouseToHome<=20 THEN 'Close distance' 
WHEN WarehouseToHome<=30 THEN 'Moderate distance' 
ELSE 'Far distance' 
END;

ALTER TABLE ecommerce_dataset 
ADD COLUMN TenureRange VARCHAR(50);

UPDATE ecommerce_dataset 
SET TenureRange=
CASE 
WHEN Tenure<=6 THEN '6 Months' 
WHEN Tenure<=12 THEN '1 Year' 
WHEN Tenure<=24 THEN '2 Year' 
ELSE 'More than 2 Years' 
END;

ALTER TABLE ecommerce_dataset 
ADD COLUMN CashbackAmountRange VARCHAR(50);

UPDATE ecommerce_dataset 
SET CashbackAmountRange=
CASE 
WHEN CashbackAmount<=100 THEN 'Low Cashback Amount' 
WHEN CashbackAmount<=200 THEN 'Moderate Cashback Amount' 
WHEN CashbackAmount<=300 THEN 'High Cashback Amount' 
ELSE 'Very High Cashback Amount' 
END;
