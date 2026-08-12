-- ============================================
-- CUSTOMER ANALYSIS
-- ============================================


-- ============================================
-- 1. CUSTOMER SALES AND PROFIT
-- ============================================

SELECT
    Customer_ID,
    Customer_Name,
    Segment,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM sales
GROUP BY
    Customer_ID,
    Customer_Name,
    Segment
ORDER BY Total_Sales DESC;


-- ============================================
-- 2. TOP 10 CUSTOMERS BY SALES
-- ============================================

SELECT
    Customer_ID,
    Customer_Name,
    Segment,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY
    Customer_ID,
    Customer_Name,
    Segment
ORDER BY Total_Sales DESC
LIMIT 10;


-- ============================================
-- 3. TOP 10 CUSTOMERS BY PROFIT
-- ============================================

SELECT
    Customer_ID,
    Customer_Name,
    Segment,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY
    Customer_ID,
    Customer_Name,
    Segment
ORDER BY Total_Profit DESC
LIMIT 10;


-- ============================================
-- 4. CUSTOMER SEGMENT PERFORMANCE
-- ============================================

SELECT
    Segment,
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin
FROM sales
GROUP BY Segment
ORDER BY Total_Sales DESC;


-- ============================================
-- 5. TOP 10 CUSTOMERS BY PROFIT MARGIN
-- ============================================

SELECT
    Customer_ID,
    Customer_Name,
    Segment,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin
FROM sales
GROUP BY
    Customer_ID,
    Customer_Name,
    Segment
HAVING SUM(Sales) > 0
ORDER BY Profit_Margin DESC
LIMIT 10;


-- ============================================
-- 6. CUSTOMERS WITH NEGATIVE PROFIT
-- ============================================

SELECT
    Customer_ID,
    Customer_Name,
    Segment,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY
    Customer_ID,
    Customer_Name,
    Segment
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;


-- ============================================
-- 7. CUSTOMER ORDERS AND AVERAGE ORDER VALUE
-- ============================================

SELECT
    Customer_ID,
    Customer_Name,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Sales) / COUNT(DISTINCT Order_ID), 2) AS Average_Order_Value
FROM sales
GROUP BY
    Customer_ID,
    Customer_Name
ORDER BY Total_Sales DESC;


-- ============================================
-- 8. TOP 10 CUSTOMERS BY NUMBER OF ORDERS
-- ============================================

SELECT
    Customer_ID,
    Customer_Name,
    Segment,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY
    Customer_ID,
    Customer_Name,
    Segment
ORDER BY Total_Orders DESC
LIMIT 10;