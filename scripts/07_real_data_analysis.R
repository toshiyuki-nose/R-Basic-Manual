############################################################
# 07_real_data_analysis.R
# R Basic Manual
#
# Purpose:
# Learn a basic real data analysis workflow in R.
# Workflow:
# Read CSV -> inspect data -> summarize -> visualize
############################################################

# ----------------------------------------------------------
# 1. Read CSV
# ----------------------------------------------------------

sales_data <- read.csv("data/sample_sales.csv", stringsAsFactors = FALSE)

sales_data


# ----------------------------------------------------------
# 2. Inspect data
# ----------------------------------------------------------

head(sales_data)
str(sales_data)
dim(sales_data)
names(sales_data)
summary(sales_data)


# ----------------------------------------------------------
# 3. Basic summaries
# ----------------------------------------------------------

sum(sales_data$sales)
mean(sales_data$sales)
max(sales_data$sales)
min(sales_data$sales)


# ----------------------------------------------------------
# 4. Filter rows
# ----------------------------------------------------------

sales_data[sales_data$region == "Tokyo", ]
sales_data[sales_data$category == "Beverage", ]


# ----------------------------------------------------------
# 5. Aggregate by category
# ----------------------------------------------------------

aggregate(sales ~ category, data = sales_data, sum)
aggregate(quantity ~ category, data = sales_data, sum)


# ----------------------------------------------------------
# 6. Aggregate by region
# ----------------------------------------------------------

aggregate(sales ~ region, data = sales_data, sum)


# ----------------------------------------------------------
# 7. Count by product
# ----------------------------------------------------------

table(sales_data$product)


# ----------------------------------------------------------
# 8. Simple visualizations
# ----------------------------------------------------------

hist(
  sales_data$sales,
  main = "Histogram of Sales",
  xlab = "Sales",
  col = "lightblue"
)

boxplot(
  sales_data$sales,
  main = "Boxplot of Sales",
  col = "lightgreen"
)

barplot(
  table(sales_data$category),
  main = "Count by Category",
  col = "orange"
)


# ----------------------------------------------------------
# 9. Barplot of aggregated sales by region
# ----------------------------------------------------------

sales_by_region <- aggregate(sales ~ region, data = sales_data, sum)

barplot(
  sales_by_region$sales,
  names.arg = sales_by_region$region,
  main = "Total Sales by Region",
  col = "skyblue"
)


# ----------------------------------------------------------
# End of script
# ----------------------------------------------------------

print("07_real_data_analysis.R finished successfully")

