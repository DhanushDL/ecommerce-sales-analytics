-- ============================================
-- PRODUCT ANALYSIS
-- ============================================


-- ============================================
-- 1. PRODUCT SALES AND PROFIT
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
ORDER BY Total_Sales DESC;


-- ============================================
-- 2. TOP 10 PRODUCTS BY SALES
-- ============================================

SELECT
    Product_ID,
    Product_Name,
    Category,
    Sub_Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY
    Product_ID,
    Product_Name,
    Category,
    Sub_Category
ORDER BY Total_Sales DESC
LIMIT 10;


-- ============================================
-- 3. TOP 10 PRODUCTS BY PROFIT
-- ============================================

SELECT
    Product_ID,
    Product_Name,
    Category,
    Sub_Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY
    Product_ID,
    Product_Name,
    Category,
    Sub_Category
ORDER BY Total_Profit DESC
LIMIT 10;


-- ============================================
-- 4. CATEGORY PERFORMANCE
-- ============================================

SELECT
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin
FROM sales
GROUP BY Category
ORDER BY Total_Sales DESC;


-- ============================================
-- 5. SUB-CATEGORY PERFORMANCE
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
-- 6. TOP 10 PRODUCTS BY PROFIT MARGIN
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


-- ============================================
-- 7. PRODUCTS WITH NEGATIVE PROFIT
-- ============================================

SELECT
    Product_ID,
    Product_Name,
    Category,
    Sub_Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY
    Product_ID,
    Product_Name,
    Category,
    Sub_Category
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;


-- ============================================
-- 8. SALES BY CATEGORY AND SUB-CATEGORY
-- ============================================

SELECT
    Category,
    Sub_Category,
    COUNT(DISTINCT Product_ID) AS Total_Products,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY
    Category,
    Sub_Category
ORDER BY Total_Sales DESC;