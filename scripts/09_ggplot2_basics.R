############################################################
# 09_ggplot2_basics.R
# R Basic Manual
#
# Purpose:
# Learn basic data visualization using ggplot2.
############################################################

# ----------------------------------------------------------
# 1. Install and load ggplot2
# ----------------------------------------------------------

# Install ggplot2 only if it is not installed
# install.packages("ggplot2")

library(ggplot2)


# ----------------------------------------------------------
# 2. Create sample data
# ----------------------------------------------------------

students <- data.frame(
  id = 1:8,
  name = c("Alice", "Bob", "Carol", "David", "Emma", "Frank", "Grace", "Henry"),
  score = c(85, 90, 78, 92, 88, 76, 95, 89),
  study_hours = c(3, 4, 2, 5, 4, 2, 6, 5),
  class = c("A", "A", "B", "B", "A", "B", "A", "B")
)

students


# ----------------------------------------------------------
# 3. Basic scatter plot
# ----------------------------------------------------------

ggplot(students, aes(x = study_hours, y = score)) +
  geom_point()


# ----------------------------------------------------------
# 4. Scatter plot with color
# ----------------------------------------------------------

ggplot(students, aes(x = study_hours, y = score, color = class)) +
  geom_point()


# ----------------------------------------------------------
# 5. Add title and labels
# ----------------------------------------------------------

ggplot(students, aes(x = study_hours, y = score, color = class)) +
  geom_point() +
  labs(
    title = "Study Hours and Scores",
    x = "Study Hours",
    y = "Score",
    color = "Class"
  )


# ----------------------------------------------------------
# 6. Bar chart
# ----------------------------------------------------------

ggplot(students, aes(x = class)) +
  geom_bar()


# ----------------------------------------------------------
# 7. Boxplot
# ----------------------------------------------------------

ggplot(students, aes(x = class, y = score)) +
  geom_boxplot()


# ----------------------------------------------------------
# 8. Histogram
# ----------------------------------------------------------

ggplot(students, aes(x = score)) +
  geom_histogram(binwidth = 5)


# ----------------------------------------------------------
# 9. Add a smooth line
# ----------------------------------------------------------

ggplot(students, aes(x = study_hours, y = score)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)


# ----------------------------------------------------------
# End of script
# ----------------------------------------------------------

print("09_ggplot2_basics.R finished successfully")

