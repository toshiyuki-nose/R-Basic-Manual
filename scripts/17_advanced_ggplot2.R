############################################################
# 17_advanced_ggplot2.R
# R Basic Manual
#
# Purpose:
# Learn how to customize and organize ggplot2 visualizations
# to communicate data insights clearly.
#
# This chapter connects data manipulation with visualization:
# Analyze -> Visualize -> Compare -> Customize -> Communicate
############################################################


# ----------------------------------------------------------
# 1. Install and load packages
# ----------------------------------------------------------

# Run these once if the packages are not installed:
# install.packages("dplyr")
# install.packages("ggplot2")

library(dplyr)
library(ggplot2)


# ----------------------------------------------------------
# 2. Prepare sample sales data
# ----------------------------------------------------------

sales_data <- data.frame(
  region = c(
    "Tokyo", "Tokyo", "Tokyo",
    "Osaka", "Osaka", "Osaka",
    "Fukuoka", "Fukuoka", "Fukuoka"
  ),
  category = rep(c("Books", "Electronics", "Food"), 3),
  sales = c(
    7200, 9800, 5600,
    6100, 11200, 4900,
    4800, 7600, 5900
  )
)

sales_data


# ----------------------------------------------------------
# 3. Review the ggplot2 structure
# ----------------------------------------------------------

ggplot(
  sales_data,
  aes(x = category, y = sales)
) +
  geom_col()


# ----------------------------------------------------------
# 4. Visualize summarized data
# ----------------------------------------------------------

category_sales <- sales_data |>
  group_by(category) |>
  summarise(
    sales = sum(sales),
    .groups = "drop"
  )

category_sales

ggplot(
  category_sales,
  aes(x = category, y = sales)
) +
  geom_col()


# ----------------------------------------------------------
# 5. Customize titles and labels
# ----------------------------------------------------------

ggplot(
  category_sales,
  aes(x = category, y = sales)
) +
  geom_col() +
  labs(
    title = "Sales by Category",
    subtitle = "Total sales across all regions",
    x = "Category",
    y = "Sales"
  )


# ----------------------------------------------------------
# 6. Customize themes
# ----------------------------------------------------------

ggplot(
  category_sales,
  aes(x = category, y = sales)
) +
  geom_col() +
  labs(
    title = "Sales by Category",
    x = "Category",
    y = "Sales"
  ) +
  theme_minimal()

ggplot(
  category_sales,
  aes(x = category, y = sales)
) +
  geom_col() +
  theme_classic()

ggplot(
  category_sales,
  aes(x = category, y = sales)
) +
  geom_col() +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold"),
    axis.text.x = element_text(angle = 45, hjust = 1)
  ) +
  labs(title = "Sales by Category")


# ----------------------------------------------------------
# 7. Control categories and axes
# ----------------------------------------------------------

ggplot(
  category_sales,
  aes(
    x = reorder(category, sales),
    y = sales
  )
) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Sales by Category",
    x = "Category",
    y = "Sales"
  ) +
  theme_minimal()


# ----------------------------------------------------------
# 8. Use color and fill effectively
# ----------------------------------------------------------

ggplot(
  sales_data,
  aes(
    x = category,
    y = sales,
    fill = region
  )
) +
  geom_col(position = "dodge") +
  labs(
    title = "Sales by Category and Region",
    x = "Category",
    y = "Sales",
    fill = "Region"
  ) +
  theme_minimal()

# A manual scale can be used when specific colors are required.
# Example:
#
# + scale_fill_manual(
#     values = c(
#       "Tokyo" = "steelblue",
#       "Osaka" = "orange",
#       "Fukuoka" = "seagreen"
#     )
#   )


# ----------------------------------------------------------
# 9. Compare groups with facets
# ----------------------------------------------------------

ggplot(
  sales_data,
  aes(x = category, y = sales)
) +
  geom_col() +
  facet_wrap(~ region) +
  labs(
    title = "Sales by Category for Each Region",
    x = "Category",
    y = "Sales"
  ) +
  theme_minimal()

ggplot(
  sales_data,
  aes(x = category, y = sales)
) +
  geom_col() +
  facet_grid(region ~ .) +
  theme_minimal()


# ----------------------------------------------------------
# 10. Add reference and trend information
# ----------------------------------------------------------

average_sales <- mean(sales_data$sales)

ggplot(
  sales_data,
  aes(x = category, y = sales)
) +
  geom_point() +
  geom_hline(
    yintercept = average_sales,
    linetype = "dashed"
  ) +
  facet_wrap(~ region) +
  labs(
    title = "Sales Compared with Overall Average",
    x = "Category",
    y = "Sales"
  ) +
  theme_minimal()

trend_data <- data.frame(
  month = 1:8,
  sales = c(100, 120, 115, 145, 150, 165, 170, 195)
)

ggplot(
  trend_data,
  aes(x = month, y = sales)
) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Sales Trend",
    x = "Month",
    y = "Sales"
  ) +
  theme_minimal()


# ----------------------------------------------------------
# 11. Add text annotations
# ----------------------------------------------------------

ggplot(
  category_sales,
  aes(
    x = reorder(category, sales),
    y = sales
  )
) +
  geom_col() +
  geom_text(
    aes(label = sales),
    hjust = -0.1
  ) +
  coord_flip() +
  labs(
    title = "Sales by Category",
    x = "Category",
    y = "Sales"
  ) +
  theme_minimal()

ggplot(
  trend_data,
  aes(x = month, y = sales)
) +
  geom_line() +
  geom_point() +
  annotate(
    "text",
    x = 8,
    y = 195,
    label = "Highest sales",
    vjust = -1
  ) +
  theme_minimal()


# ----------------------------------------------------------
# 12. Save plots
# ----------------------------------------------------------

final_plot <- ggplot(
  category_sales,
  aes(
    x = reorder(category, sales),
    y = sales
  )
) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Sales by Category",
    x = "Category",
    y = "Sales"
  ) +
  theme_minimal()

# Uncomment to save the plot:
# ggsave(
#   filename = "sales_by_category.png",
#   plot = final_plot,
#   width = 8,
#   height = 5
# )

final_plot


# ----------------------------------------------------------
# 13. Build an analysis visualization
# ----------------------------------------------------------

region_category_sales <- sales_data |>
  group_by(region, category) |>
  summarise(
    sales = sum(sales),
    .groups = "drop"
  )

analysis_plot <- ggplot(
  region_category_sales,
  aes(
    x = reorder(category, sales),
    y = sales
  )
) +
  geom_col() +
  coord_flip() +
  facet_wrap(~ region) +
  labs(
    title = "Category Sales by Region",
    subtitle = "Comparison of sales patterns across regions",
    x = "Category",
    y = "Sales"
  ) +
  theme_minimal()

analysis_plot


# ----------------------------------------------------------
# End of script
# ----------------------------------------------------------

print("17_advanced_ggplot2.R finished successfully")

