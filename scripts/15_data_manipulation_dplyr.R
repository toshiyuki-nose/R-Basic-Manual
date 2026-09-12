############################################################
# 15_data_manipulation_dplyr.R
# R Basic Manual
#
# Purpose:
# Learn how to manipulate and summarize data efficiently
# using dplyr.
#
# This chapter connects data manipulation techniques learned
# with base R to a clear, readable dplyr workflow.
############################################################

# ----------------------------------------------------------
# 1. Install and load dplyr
# ----------------------------------------------------------
# Run this once if dplyr is not installed:
# install.packages("dplyr")
library(dplyr)

# ----------------------------------------------------------
# 2. Prepare sample data
# ----------------------------------------------------------
sales_data <- data.frame(
  order_id = 1:10,
  region = c("Tokyo","Osaka","Tokyo","Fukuoka","Osaka",
             "Tokyo","Fukuoka","Tokyo","Osaka","Tokyo"),
  category = c("Books","Food","Food","Books","Books",
               "Electronics","Food","Books","Electronics","Food"),
  product = c("Book A","Coffee","Tea","Book B","Book C",
              "Mouse","Snack","Book D","Keyboard","Juice"),
  price = c(1200,500,300,1500,1000,2500,400,1800,4500,600),
  quantity = c(2,3,5,1,2,1,4,2,1,3)
)
sales_data

# ----------------------------------------------------------
# 3. Select columns
# ----------------------------------------------------------
selected_data <- sales_data |>
  select(order_id, region, category, price)
selected_data

# ----------------------------------------------------------
# 4. Filter rows
# ----------------------------------------------------------
tokyo_sales <- sales_data |>
  filter(region == "Tokyo")
tokyo_sales

# ----------------------------------------------------------
# 5. Sort rows
# ----------------------------------------------------------
sorted_sales <- sales_data |>
  arrange(desc(price))
sorted_sales

# ----------------------------------------------------------
# 6. Create calculated columns
# ----------------------------------------------------------
sales_with_total <- sales_data |>
  mutate(total_sales = price * quantity)
sales_with_total

# ----------------------------------------------------------
# 7. Summarize data
# ----------------------------------------------------------
sales_summary <- sales_data |>
  summarise(
    total_quantity = sum(quantity),
    average_price = mean(price),
    maximum_price = max(price)
  )
sales_summary

# ----------------------------------------------------------
# 8. Group data
# ----------------------------------------------------------
grouped_sales <- sales_data |>
  group_by(category)
grouped_sales

# ----------------------------------------------------------
# 9. Group and summarize
# ----------------------------------------------------------
category_summary <- sales_data |>
  mutate(total_sales = price * quantity) |>
  group_by(category) |>
  summarise(
    orders = n(),
    quantity = sum(quantity),
    sales = sum(total_sales),
    .groups = "drop"
  )
category_summary

# ----------------------------------------------------------
# 10. Use multiple conditions
# ----------------------------------------------------------
filtered_sales <- sales_data |>
  filter(
    region %in% c("Tokyo", "Osaka"),
    price >= 1000
  )
filtered_sales

books_or_food <- sales_data |>
  filter(category == "Books" | category == "Food")
books_or_food

# ----------------------------------------------------------
# 11. Chain operations with the pipe
# ----------------------------------------------------------
tokyo_summary <- sales_data |>
  filter(region == "Tokyo") |>
  mutate(total_sales = price * quantity) |>
  group_by(category) |>
  summarise(
    sales = sum(total_sales),
    .groups = "drop"
  )
tokyo_summary

# ----------------------------------------------------------
# 12. Build a simple analysis workflow
# ----------------------------------------------------------
analysis_result <- sales_data |>
  filter(region == "Tokyo") |>
  mutate(total_sales = price * quantity) |>
  group_by(category) |>
  summarise(
    orders = n(),
    quantity = sum(quantity),
    sales = sum(total_sales),
    .groups = "drop"
  ) |>
  arrange(desc(sales))
analysis_result

# ----------------------------------------------------------
# End of script
# ----------------------------------------------------------
print("15_data_manipulation_dplyr.R finished successfully")

