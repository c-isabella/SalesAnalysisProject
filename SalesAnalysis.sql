--------- Profit Percentage by State ---------
WITH T_A AS ( 
  --------- State Profit Part -----------
  SELECT State, ROUND(SUM(Profit),2) AS State_Profit
  FROM `my-data-project12345-347823.sales_store.sales_data`
  GROUP BY State
), 
T_B AS(
  ---------Total Profit Part ------------
  SELECT ROUND(SUM(Profit),2) AS Total_Profit
  FROM `my-data-project12345-347823.sales_store.sales_data`
)
SELECT T_A.State AS State, ROUND(T_A.State_Profit*100/T_B.Total_Profit, 2) AS Profit_Percentage
FROM T_A, T_B
ORDER BY Profit_Percentage DESC

--------- Total Profit by Product and Category ---------
SELECT Sub_Category AS Product, ROUND(SUM(Profit), 2) AS Total_Profit, Category
FROM `my-data-project12345-347823.sales_store.sales_data` 
GROUP BY Category, Product
ORDER BY Total_Profit DESC


--------- Total Units Sold by Product Name ---------
SELECT Sub_Category AS Product, SUM(Quantity) AS Units_Sold
FROM `my-data-project12345-347823.sales_store.sales_data`
GROUP BY Sub_Category
ORDER BY Units_Sold DESC


--------- Average Shipping Time in Days ---------
SELECT Category, Ship_Mode, ROUND(AVG(DATE_DIFF(Ship_Date, Order_Date, DAY)), 1) AS Avg_Ship_Time
FROM `my-data-project12345-347823.sales_store.sales_data`
GROUP BY Ship_Mode, Category
ORDER BY Category, Avg_Ship_Time


--------- Sales vs Profit by Category ---------
SELECT Category, ROUND(SUM(Profit), 2) AS Total_Profit, ROUND(SUM(Sales), 2) AS Total_Sales
FROM `my-data-project12345-347823.sales_store.sales_data`
GROUP BY Category
ORDER BY Category