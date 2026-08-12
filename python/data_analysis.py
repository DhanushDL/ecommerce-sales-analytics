import pandas as pd

file_path = "Data/Superstore.csv"

df = pd.read_csv(file_path, encoding="latin1")
df["Order Date"] = pd.to_datetime(df["Order Date"])
df["Ship Date"] = pd.to_datetime(df["Ship Date"])

print(df.head())
print(df.columns)
print("Dataset shape:")
print(df.shape)

print("\nDataset information:")
print(df.info())

print("\nMissing values:")
print(df.isnull().sum())
print("\n--- Business KPIs ---")

total_sales = df["Sales"].sum()
total_profit = df["Profit"].sum()
total_quantity = df["Quantity"].sum()
average_discount = df["Discount"].mean()

print("Total Sales:", total_sales)
print("Total Profit:", total_profit)
print("Total Quantity Sold:", total_quantity)
print("Average Discount:", average_discount)
print("\n--- Category Performance ---")

category_performance = df.groupby("Category")[["Sales", "Profit"]].sum()

print(category_performance)
print("\n--- Sub-Category Performance ---")

subcategory_performance = df.groupby("Sub-Category")[["Sales", "Profit"]].sum()

print(subcategory_performance.sort_values("Profit"))
print("\n--- Discount vs Profit ---")

discount_analysis = df.groupby("Discount")[["Sales", "Profit"]].agg({
    "Sales": "sum",
    "Profit": "sum"
})

print(discount_analysis)

print("\n--- Tables Discount Analysis ---")

tables = df[df["Sub-Category"] == "Tables"]

print("Total Sales:", tables["Sales"].sum())
print("Total Profit:", tables["Profit"].sum())
print("Average Discount:", tables["Discount"].mean())

print("\n--- Top 10 Loss-Making Products ---")

loss_products = (
    df.groupby("Product Name")["Profit"]
    .sum()
    .sort_values()
    .head(10)
)

print(loss_products)
print("\n--- Top 10 Most Profitable Products ---")

profitable_products = (
    df.groupby("Product Name")["Profit"]
    .sum()
    .sort_values(ascending=False)
    .head(10)
)

print(profitable_products)
print("\n--- Regional Performance ---")

regional_performance = (
    df.groupby("Region")[["Sales", "Profit"]]
    .sum()
    .sort_values("Sales", ascending=False)
)

print(regional_performance)

print("\n--- Monthly Sales Trend ---")

df["Year_Month"] = df["Order Date"].dt.to_period("M")

monthly_sales = (
    df.groupby("Year_Month")["Sales"]
    .sum()
)

print(monthly_sales)

print("\n--- Best and Worst Sales Months ---")

best_month = monthly_sales.idxmax()
best_month_sales = monthly_sales.max()

worst_month = monthly_sales.idxmin()
worst_month_sales = monthly_sales.min()

print("Best Sales Month:", best_month)
print("Best Month Sales:", best_month_sales)

print("Worst Sales Month:", worst_month)
print("Worst Month Sales:", worst_month_sales)

import matplotlib.pyplot as plt

plt.figure(figsize=(14, 7))

plt.plot(
    monthly_sales.index.astype(str),
    monthly_sales.values,
    marker="o"
)

plt.title("Monthly Sales Trend", fontsize=16)
plt.xlabel("Month")
plt.ylabel("Sales")

plt.xticks(rotation=45)

plt.grid(True, alpha=0.3)

plt.tight_layout()

plt.show()

# Category Sales and Profit Chart

category_performance = df.groupby("Category")[["Sales", "Profit"]].sum()

category_performance.plot(
    kind="bar",
    figsize=(10, 6)
)

plt.title("Sales and Profit by Category")
plt.xlabel("Category")
plt.ylabel("Amount")
plt.xticks(rotation=0)
plt.tight_layout()

plt.show()

# Regional Sales and Profit Chart

regional_performance = (
    df.groupby("Region")[["Sales", "Profit"]]
    .sum()
    .sort_values("Sales", ascending=False)
)

regional_performance.plot(
    kind="bar",
    figsize=(10, 6)
)

plt.title("Sales and Profit by Region")
plt.xlabel("Region")
plt.ylabel("Amount")
plt.xticks(rotation=0)
plt.tight_layout()

plt.show()

# Top 10 Products by Sales

top_products = (
    df.groupby("Product Name")["Sales"]
    .sum()
    .sort_values(ascending=False)
    .head(10)
    .sort_values()
)

plt.figure(figsize=(10, 6))

plt.barh(top_products.index, top_products.values)

plt.title("Top 10 Products by Sales")
plt.xlabel("Sales")
plt.ylabel("Product")

plt.tight_layout()

plt.show()