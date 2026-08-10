-- 1. Top 5 Products by Sales

SELECT 
    "Product Name",
    SUM(Sales) AS Total_Sales
FROM sales
GROUP BY "Product Name"
ORDER BY Total_Sales DESC
LIMIT 5;

-- 2. Monthly Sales Trend

SELECT 
    strftime('%Y-%m', "Order Date") AS Month,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM sales
GROUP BY Month
ORDER BY Month;


-- 3. Sales by Category

SELECT 
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM sales
GROUP BY Category
ORDER BY Total_Sales DESC;

-- 4. Sales by Region

SELECT 
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM sales
GROUP BY Region
ORDER BY Total_Sales DESC;

-- 5. Top 10 Customers by Sales

SELECT 
    "Customer Name",
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM sales
GROUP BY "Customer Name"
ORDER BY Total_Sales DESC
LIMIT 10;

-- 6. Top 10 Products by Profit

SELECT 
    "Product Name",
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM sales
GROUP BY "Product Name"
ORDER BY Total_Profit DESC
LIMIT 10;

-- 7. Average Order Value

SELECT 
    ROUND(SUM(Sales) / COUNT(DISTINCT "Order ID"), 2) AS Average_Order_Value
FROM sales;

-- 8. Products with Highest Quantity Sold

SELECT 
    "Product Name",
    SUM(Quantity) AS Total_Quantity
FROM sales
GROUP BY "Product Name"
ORDER BY Total_Quantity DESC
LIMIT 10;

-- 9. Sales by Segment

SELECT 
    Segment,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM sales
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- 10. Top Product in Each Category

WITH product_sales AS (
    SELECT
        Category,
        "Product Name",
        SUM(Sales) AS Total_Sales
    FROM sales
    GROUP BY Category, "Product Name"
),
ranked_products AS (
    SELECT
        Category,
        "Product Name",
        ROUND(Total_Sales, 2) AS Total_Sales,
        RANK() OVER (
            PARTITION BY Category
            ORDER BY Total_Sales DESC
        ) AS Product_Rank
    FROM product_sales
)
SELECT
    Category,
    "Product Name",
    Total_Sales
FROM ranked_products
WHERE Product_Rank = 1
ORDER BY Category;

-- Advanced SQL 1: CTE

WITH category_sales AS (
    SELECT
        Category,
        SUM(Sales) AS Total_Sales
    FROM sales
    GROUP BY Category
)
SELECT
    Category,
    ROUND(Total_Sales, 2) AS Total_Sales
FROM category_sales
ORDER BY Total_Sales DESC;

-- Advanced SQL 2: ROW_NUMBER

SELECT
    Category,
    "Product Name",
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROW_NUMBER() OVER (
        PARTITION BY Category
        ORDER BY SUM(Sales) DESC
    ) AS Product_Number
FROM sales
GROUP BY Category, "Product Name";

-- Advanced SQL 3: RANK

SELECT
    Category,
    "Product Name",
    ROUND(SUM(Sales), 2) AS Total_Sales,
    RANK() OVER (
        PARTITION BY Category
        ORDER BY SUM(Sales) DESC
    ) AS Sales_Rank
FROM sales
GROUP BY Category, "Product Name";

-- Advanced SQL 4: LAG

WITH monthly_sales AS (
    SELECT
        strftime('%Y-%m', "Order Date") AS Month,
        SUM(Sales) AS Total_Sales
    FROM sales
    GROUP BY Month
)
SELECT
    Month,
    ROUND(Total_Sales, 2) AS Total_Sales,
    ROUND(
        LAG(Total_Sales) OVER (ORDER BY Month), 2
    ) AS Previous_Month_Sales
FROM monthly_sales
ORDER BY Month;

-- Advanced SQL 5: LEAD

WITH monthly_sales AS (
    SELECT
        strftime('%Y-%m', "Order Date") AS Month,
        SUM(Sales) AS Total_Sales
    FROM sales
    GROUP BY Month
)
SELECT
    Month,
    ROUND(Total_Sales, 2) AS Total_Sales,
    ROUND(
        LEAD(Total_Sales) OVER (ORDER BY Month), 2
    ) AS Next_Month_Sales
FROM monthly_sales
ORDER BY Month;

-- SQL View: Monthly Sales

CREATE VIEW IF NOT EXISTS monthly_sales_view AS
SELECT
    strftime('%Y-%m', "Order Date") AS Month,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM sales
GROUP BY Month;