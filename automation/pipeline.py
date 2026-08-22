import pandas as pd
from pathlib import Path


# -----------------------------
# File Paths
# -----------------------------

BASE_DIR = Path(__file__).resolve().parent.parent

RAW_FILE = BASE_DIR / "data" / "Sample - Superstore - Copy.csv"
CLEANED_FILE = BASE_DIR / "data" / "cleaned_data.csv"
EXCEL_FILE = BASE_DIR / "reports" / "task5_kpi_report.xlsx"


# -----------------------------
# 1. Load Raw Data
# -----------------------------

print("Loading raw data...")

df = pd.read_csv(RAW_FILE, encoding="latin1")

print(f"Raw data loaded: {len(df)} rows")


# -----------------------------
# 2. Clean Data
# -----------------------------

print("Cleaning data...")

# Remove duplicate rows
df = df.drop_duplicates()

# Convert date columns
df["Order Date"] = pd.to_datetime(df["Order Date"], errors="coerce")
df["Ship Date"] = pd.to_datetime(df["Ship Date"], errors="coerce")

# Remove rows with missing important values
df = df.dropna(subset=["Order Date", "Sales", "Profit"])

# Remove invalid sales/profit values
df = df[df["Sales"] >= 0]

print(f"Cleaned data: {len(df)} rows")


# -----------------------------
# 3. Save Processed Data
# -----------------------------

df.to_csv(CLEANED_FILE, index=False)

print(f"Cleaned data saved to: {CLEANED_FILE}")


# -----------------------------
# 4. Calculate Key KPIs
# -----------------------------

total_sales = df["Sales"].sum()
total_profit = df["Profit"].sum()
total_orders = df["Order ID"].nunique()
total_customers = df["Customer ID"].nunique()
total_quantity = df["Quantity"].sum()
average_order_value = total_sales / total_orders if total_orders else 0


kpi_data = {
    "KPI": [
        "Total Sales",
        "Total Profit",
        "Total Orders",
        "Total Customers",
        "Total Quantity",
        "Average Order Value"
    ],
    "Value": [
        total_sales,
        total_profit,
        total_orders,
        total_customers,
        total_quantity,
        average_order_value
    ]
}

kpi_df = pd.DataFrame(kpi_data)


# -----------------------------
# 5. Additional Analysis
# -----------------------------

region_sales = (
    df.groupby("Region")["Sales"]
    .sum()
    .reset_index()
    .sort_values("Sales", ascending=False)
)

category_sales = (
    df.groupby("Category")["Sales"]
    .sum()
    .reset_index()
    .sort_values("Sales", ascending=False)
)

monthly_sales = (
    df.set_index("Order Date")
    .resample("ME")["Sales"]
    .sum()
    .reset_index()
)

monthly_sales["Month"] = monthly_sales["Order Date"].dt.strftime("%Y-%m")


# -----------------------------
# 6. Export to Excel
# -----------------------------

with pd.ExcelWriter(EXCEL_FILE, engine="openpyxl") as writer:

    kpi_df.to_excel(
        writer,
        sheet_name="KPIs",
        index=False
    )

    region_sales.to_excel(
        writer,
        sheet_name="Region Sales",
        index=False
    )

    category_sales.to_excel(
        writer,
        sheet_name="Category Sales",
        index=False
    )

    monthly_sales.to_excel(
        writer,
        sheet_name="Monthly Sales",
        index=False
    )

print(f"Excel report saved to: {EXCEL_FILE}")

print("\nPipeline completed successfully!")
print("\nKey KPIs:")
print(kpi_df)
df = pd.read_csv(RAW_FILE, encoding="latin1")