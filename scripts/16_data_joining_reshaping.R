############################################################
# 16_data_joining_reshaping.R
# R Basic Manual
#
# Purpose:
# Learn how to combine multiple datasets and reshape data
# for analysis using dplyr and tidyr.
#
# Real-world data is often stored across multiple tables.
# Joining and reshaping are essential steps before analysis.
############################################################


# ----------------------------------------------------------
# 1. Install and load packages
# ----------------------------------------------------------

# Run these once if the packages are not installed:
# install.packages("dplyr")
# install.packages("tidyr")

library(dplyr)
library(tidyr)


# ----------------------------------------------------------
# 2. Prepare sample datasets
# ----------------------------------------------------------

sales_data <- data.frame(
  order_id = 1:6,
  product_id = c("P001", "P002", "P001", "P003", "P004", "P999"),
  quantity = c(2, 1, 3, 2, 1, 4)
)

product_data <- data.frame(
  product_id = c("P001", "P002", "P003", "P004"),
  product_name = c("Book A", "Mouse", "Coffee", "Keyboard"),
  category = c("Books", "Electronics", "Food", "Electronics"),
  price = c(1200, 2500, 500, 4500)
)

sales_data
product_data


# ----------------------------------------------------------
# 3. Understand keys
# ----------------------------------------------------------

# product_id connects the two datasets.
# In product_data, product_id should uniquely identify each product.

product_data$product_id
duplicated(product_data$product_id)


# ----------------------------------------------------------
# 4. Join datasets with left_join()
# ----------------------------------------------------------

sales_with_products <- sales_data |>
  left_join(product_data, by = "product_id")

sales_with_products


# ----------------------------------------------------------
# 5. Join matching rows with inner_join()
# ----------------------------------------------------------

matched_sales <- sales_data |>
  inner_join(product_data, by = "product_id")

matched_sales


# ----------------------------------------------------------
# 6. Compare left_join() and inner_join()
# ----------------------------------------------------------

nrow(sales_data)
nrow(sales_with_products)
nrow(matched_sales)


# ----------------------------------------------------------
# 7. Join using different column names
# ----------------------------------------------------------

sales_alt <- data.frame(
  order_id = 1:3,
  item_code = c("P001", "P002", "P003"),
  quantity = c(1, 2, 1)
)

joined_alt <- sales_alt |>
  left_join(
    product_data,
    by = join_by(item_code == product_id)
  )

joined_alt


# ----------------------------------------------------------
# 8. Check unmatched records
# ----------------------------------------------------------

unmatched_sales <- sales_data |>
  anti_join(product_data, by = "product_id")

unmatched_sales


# ----------------------------------------------------------
# 9. Combine rows
# ----------------------------------------------------------

sales_january <- data.frame(
  order_id = 101:103,
  product_id = c("P001", "P002", "P003"),
  quantity = c(1, 2, 1)
)

sales_february <- data.frame(
  order_id = 104:106,
  product_id = c("P001", "P004", "P002"),
  quantity = c(2, 1, 3)
)

combined_sales <- bind_rows(
  sales_january,
  sales_february
)

combined_sales


# ----------------------------------------------------------
# 10. Understand wide and long data
# ----------------------------------------------------------

monthly_sales_wide <- data.frame(
  product = c("Book", "Mouse"),
  Jan = c(100, 80),
  Feb = c(120, 90),
  Mar = c(150, 110)
)

monthly_sales_wide


# ----------------------------------------------------------
# 11. Convert wide data to long format
# ----------------------------------------------------------

monthly_sales_long <- monthly_sales_wide |>
  pivot_longer(
    cols = Jan:Mar,
    names_to = "month",
    values_to = "sales"
  )

monthly_sales_long


# ----------------------------------------------------------
# 12. Convert long data to wide format
# ----------------------------------------------------------

monthly_sales_wide_again <- monthly_sales_long |>
  pivot_wider(
    names_from = month,
    values_from = sales
  )

monthly_sales_wide_again


# ----------------------------------------------------------
# 13. Build a multi-table analysis workflow
# ----------------------------------------------------------

analysis_result <- sales_data |>
  left_join(product_data, by = "product_id") |>
  filter(!is.na(product_name)) |>
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

print("16_data_joining_reshaping.R finished successfully")

