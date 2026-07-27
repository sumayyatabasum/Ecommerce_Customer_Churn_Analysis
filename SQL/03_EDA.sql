-- 03 Exploratory Data Analysis
SELECT COUNT(*) TotalCustomers,
SUM(CustomerStatus='Churned') ChurnedCustomers,
ROUND(SUM(CustomerStatus='Churned')*100.0/COUNT(*),2) 
ChurnRate FROM ecommerce_dataset;

SELECT PreferredLoginDevice,
COUNT(*) TotalCustomers,
SUM(Churn) ChurnedCustomers,
ROUND(SUM(Churn)*100.0/COUNT(*),2) ChurnRate 
FROM ecommerce_dataset 
GROUP BY PreferredLoginDevice;

SELECT CityTier,
COUNT(*) TotalCustomers,
SUM(Churn) ChurnedCustomers,
ROUND(SUM(Churn)*100.0/COUNT(*),2) ChurnRate 
FROM ecommerce_dataset 
GROUP BY CityTier 
ORDER BY ChurnRate DESC;

SELECT WarehouseToHomeRange,
COUNT(*) TotalCustomers,
SUM(Churn) ChurnedCustomers,
ROUND(SUM(Churn)*100.0/COUNT(*),2) ChurnRate 
FROM ecommerce_dataset 
GROUP BY WarehouseToHomeRange 
ORDER BY ChurnRate DESC;

SELECT PreferredPaymentMode,
COUNT(*) TotalCustomers,
SUM(Churn) ChurnedCustomers,
ROUND(SUM(Churn)*100.0/COUNT(*),2) ChurnRate 
FROM ecommerce_dataset 
GROUP BY PreferredPaymentMode 
ORDER BY ChurnRate DESC;

SELECT TenureRange,
COUNT(*) TotalCustomers,
SUM(Churn) ChurnedCustomers,
ROUND(SUM(Churn)*100.0/COUNT(*),2) ChurnRate 
FROM ecommerce_dataset 
GROUP BY TenureRange 
ORDER BY ChurnRate DESC;

SELECT Gender,
COUNT(*) TotalCustomers,
SUM(Churn) ChurnedCustomers,
ROUND(SUM(Churn)*100.0/COUNT(*),2) ChurnRate 
FROM ecommerce_dataset 
GROUP BY Gender;

SELECT PreferedOrderCat,
COUNT(*) TotalCustomers,
SUM(Churn) ChurnedCustomers,
ROUND(SUM(Churn)*100.0/COUNT(*),2) ChurnRate 
FROM ecommerce_dataset 
GROUP BY PreferedOrderCat 
ORDER BY ChurnRate DESC;

SELECT SatisfactionScore,
COUNT(*) TotalCustomers,
SUM(Churn) ChurnedCustomers,
ROUND(SUM(Churn)*100.0/COUNT(*),2) ChurnRate 
FROM ecommerce_dataset 
GROUP BY SatisfactionScore 
ORDER BY ChurnRate DESC;

SELECT ComplainRecieved,
COUNT(*) TotalCustomers,
SUM(Churn) ChurnedCustomers,
ROUND(SUM(Churn)*100.0/COUNT(*),2) ChurnRate 
FROM ecommerce_dataset 
GROUP BY ComplainRecieved 
ORDER BY ChurnRate DESC;
