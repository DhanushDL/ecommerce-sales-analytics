-- ============================================
-- PROFITABILITY ANALYSIS
-- ============================================


-- ============================================
-- 1. OVERALL PROFITABILITY
-- ============================================

SELECT
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin
FROM sales;


-- ============================================
-- 2. PROFIT BY REGION
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
-- 3. PROFIT BY CATEGORY
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
-- 4. PROFIT BY SUB-CATEGORY
-- ============================================

SELECT
    Category,
    Sub_Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin
FROM sales
GROUP BY
    Category,
    Sub_Category
ORDER BY Total_Profit DESC;


-- ============================================
-- 5. LOSS-MAKING SUB-CATEGORIES
-- ============================================

SELECT
    Category,
    Sub_Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin
FROM sales
GROUP BY
    Category,
    Sub_Category
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;


-- ============================================
-- 6. PROFIT BY CUSTOMER SEGMENT
-- ============================================

SELECT
    Segment,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin
FROM sales
GROUP BY Segment
ORDER BY Total_Profit DESC;


-- ============================================
-- 7. PROFIT BY SHIPPING MODE
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


-- ============================================
-- 8. PROFIT BY YEAR
-- ============================================

SELECT
    YEAR(Order_Date) AS Order_Year,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin
FROM sales
GROUP BY YEAR(Order_Date)
ORDER BY Order_Year;