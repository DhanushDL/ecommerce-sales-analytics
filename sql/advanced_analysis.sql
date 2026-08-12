-- ============================================
-- ADVANCED SALES ANALYSIS
-- ============================================


-- ============================================
-- 1. DISCOUNT AND PROFIT ANALYSIS
-- ============================================

SELECT
    ROUND(Discount, 2) AS Discount_Rate,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin
FROM sales
GROUP BY ROUND(Discount, 2)
ORDER BY Discount_Rate;


-- ============================================
-- 2. QUANTITY AND PROFIT ANALYSIS
-- ============================================

SELECT
    Category,
    SUM(Quantity) AS Total_Quantity,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin
FROM sales
GROUP BY Category
ORDER BY Total_Profit DESC;


-- ============================================
-- 3. TOP 10 STATES BY PROFIT
-- ============================================

SELECT
    State,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin
FROM sales
GROUP BY State
ORDER BY Total_Profit DESC
LIMIT 10;


-- ============================================
-- 4. BOTTOM 10 STATES BY PROFIT
-- ============================================

SELECT
    State,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin
FROM sales
GROUP BY State
ORDER BY Total_Profit ASC
LIMIT 10;


-- ============================================
-- 5. CITY PERFORMANCE
-- ============================================

SELECT
    City,
    State,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin
FROM sales
GROUP BY
    City,
    State
ORDER BY Total_Sales DESC
LIMIT 10;


-- ============================================
-- 6. YEARLY SALES GROWTH
-- ============================================

WITH Yearly_Sales AS (
    SELECT
        YEAR(Order_Date) AS Order_Year,
        SUM(Sales) AS Total_Sales
    FROM sales
    GROUP BY YEAR(Order_Date)
)
SELECT
    Order_Year,
    ROUND(Total_Sales, 2) AS Total_Sales,
    ROUND(
        ((Total_Sales - LAG(Total_Sales) OVER (ORDER BY Order_Year))
        / LAG(Total_Sales) OVER (ORDER BY Order_Year)) * 100,
        2
    ) AS Sales_Growth_Percent
FROM Yearly_Sales
ORDER BY Order_Year;


-- ============================================
-- 7. YEARLY PROFIT GROWTH
-- ============================================

WITH Yearly_Profit AS (
    SELECT
        YEAR(Order_Date) AS Order_Year,
        SUM(Profit) AS Total_Profit
    FROM sales
    GROUP BY YEAR(Order_Date)
)
SELECT
    Order_Year,
    ROUND(Total_Profit, 2) AS Total_Profit,
    ROUND(
        ((Total_Profit - LAG(Total_Profit) OVER (ORDER BY Order_Year))
        / ABS(LAG(Total_Profit) OVER (ORDER BY Order_Year))) * 100,
        2
    ) AS Profit_Growth_Percent
FROM Yearly_Profit
ORDER BY Order_Year;


-- ============================================
-- 8. TOP 10 PRODUCTS BY PROFIT MARGIN
-- ============================================

SELECT
    Product_ID,
    Product_Name,
    Category,
    Sub_Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin
FROM sales
GROUP BY
    Product_ID,
    Product_Name,
    Category,
    Sub_Category
HAVING SUM(Sales) > 0
ORDER BY Profit_Margin DESC
LIMIT 10;