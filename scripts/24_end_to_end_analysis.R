############################################################
# 24_end_to_end_analysis.R
# R Basic Manual
#
# Purpose:
# Apply the skills learned throughout the manual to a complete
# retail sales analysis workflow.
############################################################

library(dplyr)
library(tidyr)
library(ggplot2)

# ----------------------------------------------------------
# 1. Import raw data
# ----------------------------------------------------------
sales_raw <- read.csv("data/sample_sales_24.csv",
                      stringsAsFactors = FALSE,
                      na.strings = c("", "NA"))
cat("\n--- Raw data ---\n")
print(head(sales_raw))
str(sales_raw)

# ----------------------------------------------------------
# 2. Inspect and validate
# ----------------------------------------------------------
cat("\nRows:", nrow(sales_raw), " Columns:", ncol(sales_raw), "\n")
print(colSums(is.na(sales_raw)))
cat("Duplicate rows:", sum(duplicated(sales_raw)), "\n")
print(unique(sales_raw$region))
print(table(sales_raw$category, useNA = "ifany"))

# ----------------------------------------------------------
# 3. Clean data
# ----------------------------------------------------------
sales_clean <- sales_raw |>
  mutate(
    region = trimws(tolower(region)),
    region = ifelse(region == "tokyo", "Tokyo",
             ifelse(region == "osaka", "Osaka",
             ifelse(region == "fukuoka", "Fukuoka", region))),
    category = trimws(category),
    product = trimws(product),
    quantity = as.numeric(quantity),
    unit_price = as.numeric(unit_price),
    sales = as.numeric(sales),
    date = as.Date(date)
  )

# Recalculate missing sales when quantity and unit price are available.
sales_clean <- sales_clean |>
  mutate(
    sales = ifelse(
      is.na(sales) & !is.na(quantity) & !is.na(unit_price),
      quantity * unit_price,
      sales
    )
  )

# Remove rows that still cannot be analyzed.
sales_clean <- sales_clean |>
  filter(!is.na(date), !is.na(quantity), !is.na(unit_price), !is.na(sales),
         quantity > 0, unit_price >= 0, sales >= 0)

cat("\n--- Validation after cleaning ---\n")
print(colSums(is.na(sales_clean)))
print(unique(sales_clean$region))

# ----------------------------------------------------------
# 4. Transform data
# ----------------------------------------------------------
sales_clean <- sales_clean |>
  mutate(
    year = format(date, "%Y"),
    month = format(date, "%Y-%m"),
    weekday = format(date, "%A")
  )

# ----------------------------------------------------------
# 5. Explore and calculate KPIs
# ----------------------------------------------------------
cat("\n--- Sales summary ---\n")
print(summary(sales_clean$sales))

kpi <- sales_clean |>
  summarise(
    transactions = n(),
    total_quantity = sum(quantity),
    total_sales = sum(sales),
    average_sales = mean(sales),
    median_sales = median(sales)
  )
print(kpi)

# ----------------------------------------------------------
# 6. Analyze category and region
# ----------------------------------------------------------
category_summary <- sales_clean |>
  group_by(category) |>
  summarise(total_sales = sum(sales),
            average_sales = mean(sales),
            transactions = n(),
            .groups = "drop") |>
  arrange(desc(total_sales))
print(category_summary)

region_summary <- sales_clean |>
  group_by(region) |>
  summarise(total_sales = sum(sales),
            transactions = n(),
            .groups = "drop") |>
  arrange(desc(total_sales))
print(region_summary)

region_category <- sales_clean |>
  group_by(region, category) |>
  summarise(total_sales = sum(sales), .groups = "drop")
print(region_category)

region_category_wide <- region_category |>
  pivot_wider(names_from = category,
              values_from = total_sales,
              values_fill = 0)
print(region_category_wide)

# ----------------------------------------------------------
# 7. Analyze time trends
# ----------------------------------------------------------
monthly_summary <- sales_clean |>
  group_by(month) |>
  summarise(total_sales = sum(sales),
            transactions = n(),
            .groups = "drop")
print(monthly_summary)

weekday_summary <- sales_clean |>
  group_by(weekday) |>
  summarise(total_sales = sum(sales), .groups = "drop") |>
  arrange(desc(total_sales))
print(weekday_summary)

# ----------------------------------------------------------
# 8. Analyze products
# ----------------------------------------------------------
product_summary <- sales_clean |>
  group_by(product) |>
  summarise(
    total_sales = sum(sales),
    quantity_sold = sum(quantity),
    transactions = n(),
    average_sales = mean(sales),
    .groups = "drop"
  ) |>
  arrange(desc(total_sales))
print(product_summary)

# ----------------------------------------------------------
# 9. Basic statistics
# ----------------------------------------------------------
cat("\nMean sales:", mean(sales_clean$sales), "\n")
cat("Median sales:", median(sales_clean$sales), "\n")
cat("SD sales:", sd(sales_clean$sales), "\n")
cat("Correlation quantity-sales:",
    cor(sales_clean$quantity, sales_clean$sales), "\n")

# ----------------------------------------------------------
# 10. Visualize
# ----------------------------------------------------------
p_category <- ggplot(category_summary,
                     aes(x = reorder(category, total_sales),
                         y = total_sales)) +
  geom_col() +
  coord_flip() +
  labs(title = "Sales by Category", x = "Category", y = "Sales") +
  theme_minimal()
print(p_category)

p_region <- ggplot(region_summary,
                   aes(x = reorder(region, total_sales),
                       y = total_sales)) +
  geom_col() +
  coord_flip() +
  labs(title = "Sales by Region", x = "Region", y = "Sales") +
  theme_minimal()
print(p_region)

p_month <- ggplot(monthly_summary,
                  aes(x = month, y = total_sales, group = 1)) +
  geom_line() +
  geom_point() +
  labs(title = "Monthly Sales Trend", x = "Month", y = "Sales") +
  theme_minimal()
print(p_month)

p_quantity <- ggplot(sales_clean,
                     aes(x = quantity, y = sales)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Quantity vs Sales", x = "Quantity", y = "Sales") +
  theme_minimal()
print(p_quantity)

# ----------------------------------------------------------
# 11. Built-in dataset exercise
# ----------------------------------------------------------
data(airquality)
cat("\n--- Built-in dataset: airquality ---\n")
print(head(airquality))
print(colSums(is.na(airquality)))

airquality_summary <- airquality |>
  summarise(
    rows = n(),
    mean_temp = mean(Temp, na.rm = TRUE),
    mean_wind = mean(Wind, na.rm = TRUE),
    missing_ozone = sum(is.na(Ozone))
  )
print(airquality_summary)

# ----------------------------------------------------------
# End of script
# ----------------------------------------------------------
print("24_end_to_end_analysis.R finished successfully")

