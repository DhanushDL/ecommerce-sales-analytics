# Ecommerce Sales Analytics

## 📌 Project Overview

Ecommerce Sales Analytics is a data analytics project built using **Python, Pandas, Matplotlib, and MySQL** to analyze Superstore ecommerce sales data.

The project focuses on understanding sales performance, profitability, customer behavior, product performance, regional trends, and business growth patterns.

## 🎯 Objectives

* Analyze overall sales and profit performance
* Identify profitable and loss-making products
* Analyze customer and customer-segment performance
* Compare sales and profit across regions
* Analyze category and sub-category performance
* Identify top-performing states and products
* Study monthly and yearly sales trends
* Analyze the relationship between discounts and profitability
* Generate useful business insights from the dataset

## 🛠️ Technologies Used

* **Python**
* **Pandas**
* **Matplotlib**
* **MySQL**
* **SQL**
* **CSV Dataset**
* **VS Code**

## 📂 Project Structure

```text
ECOMMERCE-SALES-ANALYTICS/
│
├── Data/
│   └── Superstore.csv
│
├── python/
│   └── data_analysis.py
│
├── sql/
│   ├── sales_analysis.sql
│   ├── customer_analysis.sql
│   ├── product_analysis.sql
│   ├── profitability_analysis.sql
│   └── advanced_analysis.sql
│
└── README.md
```

## 📊 Dataset

The project uses the **Superstore dataset**, containing information about orders, customers, products, sales, profit, discounts, shipping modes, regions, categories, and dates.

Important fields include:

* Order ID
* Order Date
* Ship Date
* Customer ID
* Customer Name
* Segment
* Region
* State
* City
* Product ID
* Product Name
* Category
* Sub-Category
* Sales
* Quantity
* Discount
* Profit
* Ship Mode

## 🐍 Python Analysis

The Python program performs:

* Dataset loading and inspection
* Date conversion
* Missing-value analysis
* Business KPI calculation
* Category analysis
* Sub-category analysis
* Discount vs. profit analysis
* Loss-making product analysis
* Most profitable product analysis
* Regional performance analysis
* Monthly sales analysis
* Sales trend visualization
* Category sales and profit visualization
* Regional sales and profit visualization
* Top 10 products by sales visualization

## 🗄️ SQL Analysis

The MySQL analysis is divided into multiple SQL files.

### Sales Analysis

Includes:

* Overall sales performance
* Yearly sales and profit
* Monthly sales and profit
* Regional performance
* Category performance
* Customer segment performance
* Top states by sales
* Shipping mode performance

### Customer Analysis

Includes:

* Customer sales and profit
* Top customers by sales
* Top customers by profit
* Customer segment performance
* Customer profit margin
* Loss-making customers
* Average order value
* Customers with the highest number of orders

### Product Analysis

Includes:

* Product sales and profit
* Top products by sales
* Top products by profit
* Category performance
* Sub-category performance
* Product profit margins
* Loss-making products
* Category and sub-category analysis

### Profitability Analysis

Includes:

* Overall profitability
* Profit by region
* Profit by category
* Profit by sub-category
* Loss-making sub-categories
* Profit by customer segment
* Profit by shipping mode
* Yearly profitability

### Advanced Analysis

Includes:

* Discount and profit analysis
* Quantity and profit analysis
* Top and bottom states by profit
* City performance
* Yearly sales growth
* Yearly profit growth
* Product profit-margin analysis

## 📈 Key Business KPI

The SQL analysis calculates important KPIs such as:

* Total Sales
* Total Profit
* Profit Margin
* Total Orders
* Total Customers
* Total Quantity Sold
* Average Discount
* Average Order Value

## ▶️ How to Run the Python Analysis

From the project root directory:

```bash
python python/data_analysis.py
```

## ▶️ How to Run the SQL Analysis

1. Start MySQL.
2. Select the project database:

```sql
USE ecommerce_sales;
```

3. Make sure the `sales` table is available.
4. Execute the SQL files from the `sql` folder.

## 💡 Business Insights

The analysis can be used to identify:

* High-revenue products and customers
* Highly profitable product categories
* Loss-making products and sub-categories
* Strong and weak-performing regions
* Sales trends over time
* The effect of discounts on profitability
* Opportunities for improving business performance

## 🚀 Future Improvements

Possible future improvements include:

* Building an interactive Power BI dashboard
* Adding automated data-cleaning pipelines
* Creating additional customer segmentation
* Adding forecasting for future sales
* Connecting Python directly to MySQL
* Adding interactive Plotly visualizations
* Deploying the dashboard as a web application

## 👨‍💻 Project Type

**Data Analytics / Business Intelligence Project**

Technologies: **Python | Pandas | Matplotlib | MySQL | SQL**

## 📊 Project Visualizations

### Monthly Sales Trend
![Monthly Sales Trend](Screenshots/monthly%20sales%20trend.png)

### Sales and Profit by Category
![Sales and Profit by Category](Screenshots/sales%20and%20profit%20by%20category.png)

### Sales and Profit by Region
![Sales and Profit by Region](Screenshots/sales%20and%20profit%20by%20region.png)

### Top 10 Products by Sales
![Top 10 Products by Sales](Screenshots/top%2010%20products%20by%20sale.png)