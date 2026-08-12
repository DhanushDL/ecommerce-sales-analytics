-- ============================================
-- 1. OVERALL SALES PERFORMANCE
-- ============================================

SELECT
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM sales;


-- ============================================
-- 2. SALES AND PROFIT BY YEAR
-- ============================================

SELECT
    YEAR(Order_Date) AS Order_Year,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin
FROM sales
GROUP BY YEAR(Order_Date)
ORDER BY Order_Year;


-- ============================================
-- 3. SALES AND PROFIT BY MONTH
-- ============================================

SELECT
    YEAR(Order_Date) AS Order_Year,
    MONTH(Order_Date) AS Order_Month,
    MONTHNAME(Order_Date) AS Month_Name,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY
    YEAR(Order_Date),
    MONTH(Order_Date),
    MONTHNAME(Order_Date)
ORDER BY
    Order_Year,
    Order_Month;


-- ============================================
-- 4. SALES AND PROFIT BY REGION
-- ============================================

SELECT
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin
FROM sales
GROUP BY Region
ORDER BY Total_Profit DESC;


-- ============================================
-- 5. SALES AND PROFIT BY CATEGORY
-- ============================================

SELECT
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin
FROM sales
GROUP BY Category
ORDER BY Total_Profit DESC;


-- ============================================
-- 6. SALES AND PROFIT BY CUSTOMER SEGMENT
-- ============================================

SELECT
    Segment,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin
FROM sales
GROUP BY Segment
ORDER BY Total_Sales DESC;


-- ============================================
-- 7. TOP 10 STATES BY SALES
-- ============================================

SELECT
    State,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10;


-- ============================================
-- 8. SHIPPING MODE PERFORMANCE
-- ============================================

SELECT
    Ship_Mode,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin
FROM sales
GROUP BY Ship_Mode
ORDER BY Total_Profit DESC;