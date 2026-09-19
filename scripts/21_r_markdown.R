############################################################
# 21_r_markdown.R
# R Basic Manual
#
# Purpose:
# Prepare and test the R code used in the Chapter 21
# R Markdown report.
#
# Workflow:
# Data -> Analysis -> Visualization -> Report
############################################################

# ----------------------------------------------------------
# 1. Load packages
# ----------------------------------------------------------

# Run these once if the packages are not installed:
# install.packages("dplyr")
# install.packages("ggplot2")

library(dplyr)
library(ggplot2)


# ----------------------------------------------------------
# 2. Prepare sample data
# ----------------------------------------------------------

sales_data <- data.frame(
  category = c(
    "Books", "Electronics", "Food",
    "Books", "Electronics", "Food",
    "Books", "Electronics", "Food"
  ),
  region = c(
    "Tokyo", "Tokyo", "Tokyo",
    "Osaka", "Osaka", "Osaka",
    "Fukuoka", "Fukuoka", "Fukuoka"
  ),
  sales = c(
    2400, 2500, 1800,
    3000, 5000, 1500,
    1200, 4500, 2000
  )
)

sales_data


# ----------------------------------------------------------
# 3. Inspect the data
# ----------------------------------------------------------

head(sales_data)
str(sales_data)
summary(sales_data)


# ----------------------------------------------------------
# 4. Create an analysis summary
# ----------------------------------------------------------

category_summary <- sales_data |>
  group_by(category) |>
  summarise(
    total_sales = sum(sales),
    average_sales = mean(sales),
    records = n(),
    .groups = "drop"
  ) |>
  arrange(desc(total_sales))

category_summary


# ----------------------------------------------------------
# 5. Create a visualization
# ----------------------------------------------------------

sales_plot <- ggplot(
  category_summary,
  aes(
    x = reorder(category, total_sales),
    y = total_sales
  )
) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Total Sales by Category",
    x = "Category",
    y = "Total Sales"
  ) +
  theme_minimal()

sales_plot


# ----------------------------------------------------------
# 6. Prepare values for report text
# ----------------------------------------------------------

total_sales <- sum(sales_data$sales)

top_category <- category_summary$category[1]

total_sales
top_category


# ----------------------------------------------------------
# End of script
# ----------------------------------------------------------

print("21_r_markdown.R finished successfully")

