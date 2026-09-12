############################################################
# 18_statistical_analysis.R
# R Basic Manual
#
# Purpose:
# Learn how to use basic statistical methods in R to examine
# relationships, differences, and patterns in data.
#
# The goal is to connect descriptive statistics and
# visualization with basic statistical testing and modeling.
############################################################


# ----------------------------------------------------------
# 1. Prepare sample data
# ----------------------------------------------------------

sales_data <- data.frame(
  advertising = c(10, 12, 15, 18, 20, 23, 25, 28, 30, 35),
  sales = c(100, 115, 130, 145, 155, 170, 180, 195, 205, 230)
)

score_data <- data.frame(
  group = c(
    rep("A", 8),
    rep("B", 8),
    rep("C", 8)
  ),
  score = c(
    72, 75, 78, 74, 80, 77, 76, 79,
    82, 85, 81, 88, 84, 86, 83, 87,
    68, 70, 72, 69, 74, 71, 73, 70
  )
)

sales_data
score_data


# ----------------------------------------------------------
# 2. Review descriptive statistics
# ----------------------------------------------------------

mean(sales_data$sales)
median(sales_data$sales)
sd(sales_data$sales)
summary(sales_data$sales)

aggregate(
  score ~ group,
  data = score_data,
  FUN = mean
)


# ----------------------------------------------------------
# 3. Understand correlation
# ----------------------------------------------------------

correlation <- cor(
  sales_data$advertising,
  sales_data$sales
)

correlation


# ----------------------------------------------------------
# 4. Visualize a relationship
# ----------------------------------------------------------

# Run this once if ggplot2 is not installed:
# install.packages("ggplot2")

library(ggplot2)

ggplot(
  sales_data,
  aes(x = advertising, y = sales)
) +
  geom_point() +
  geom_smooth(
    method = "lm",
    se = FALSE
  ) +
  labs(
    title = "Advertising and Sales",
    x = "Advertising",
    y = "Sales"
  ) +
  theme_minimal()


# ----------------------------------------------------------
# 5. Build a simple linear regression model
# ----------------------------------------------------------

model <- lm(
  sales ~ advertising,
  data = sales_data
)

model


# ----------------------------------------------------------
# 6. Inspect a regression model
# ----------------------------------------------------------

summary(model)


# ----------------------------------------------------------
# 7. Make predictions with a model
# ----------------------------------------------------------

new_data <- data.frame(
  advertising = c(16, 22, 32)
)

predicted_sales <- predict(
  model,
  newdata = new_data
)

prediction_result <- data.frame(
  advertising = new_data$advertising,
  predicted_sales = predicted_sales
)

prediction_result


# ----------------------------------------------------------
# 8. Compare two groups
# ----------------------------------------------------------

two_group_data <- subset(
  score_data,
  group %in% c("A", "B")
)

t_test_result <- t.test(
  score ~ group,
  data = two_group_data
)

t_test_result


# ----------------------------------------------------------
# 9. Compare multiple groups
# ----------------------------------------------------------

anova_model <- aov(
  score ~ group,
  data = score_data
)

summary(anova_model)


# ----------------------------------------------------------
# 10. Examine categorical relationships
# ----------------------------------------------------------

survey_data <- data.frame(
  device = c(
    "PC", "PC", "PC", "PC", "PC",
    "Mobile", "Mobile", "Mobile", "Mobile", "Mobile",
    "Tablet", "Tablet", "Tablet", "Tablet", "Tablet"
  ),
  purchased = c(
    "Yes", "Yes", "No", "Yes", "No",
    "Yes", "No", "No", "Yes", "No",
    "No", "No", "Yes", "No", "No"
  )
)

survey_table <- table(
  survey_data$device,
  survey_data$purchased
)

survey_table

chi_square_result <- chisq.test(survey_table)

chi_square_result


# ----------------------------------------------------------
# 11. Check p-values
# ----------------------------------------------------------

t_test_result$p.value
summary(anova_model)[[1]][["Pr(>F)"]][1]
chi_square_result$p.value


# ----------------------------------------------------------
# 12. Statistical and practical meaning
# ----------------------------------------------------------

group_summary <- aggregate(
  score ~ group,
  data = score_data,
  FUN = mean
)

group_summary

# Statistical significance should not be interpreted alone.
# Also examine the size of differences, the data itself,
# and the practical meaning of the result.


# ----------------------------------------------------------
# 13. Build a statistical analysis workflow
# ----------------------------------------------------------

# Question:
# Is advertising associated with sales?

# 1. Explore the data
summary(sales_data)

# 2. Measure correlation
cor(
  sales_data$advertising,
  sales_data$sales
)

# 3. Visualize the relationship
analysis_plot <- ggplot(
  sales_data,
  aes(x = advertising, y = sales)
) +
  geom_point() +
  geom_smooth(
    method = "lm",
    se = FALSE
  ) +
  labs(
    title = "Relationship between Advertising and Sales",
    x = "Advertising",
    y = "Sales"
  ) +
  theme_minimal()

analysis_plot

# 4. Build and inspect a model
analysis_model <- lm(
  sales ~ advertising,
  data = sales_data
)

summary(analysis_model)

# 5. Interpret the result together with the data and plot


# ----------------------------------------------------------
# End of script
# ----------------------------------------------------------

print("18_statistical_analysis.R finished successfully")
