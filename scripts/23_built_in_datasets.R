############################################################
# 23_built_in_datasets.R
# R Basic Manual
#
# Purpose:
# Learn how to use R built-in datasets to practice a
# repeatable data analysis workflow without external files.
############################################################

# ----------------------------------------------------------
# 1. List and load built-in datasets
# ----------------------------------------------------------
data()
data(iris)
head(iris)

# Documentation (run interactively)
# ?iris
# help(iris)

# ----------------------------------------------------------
# 2. Inspect iris
# ----------------------------------------------------------
head(iris)
str(iris)
summary(iris)
dim(iris)
names(iris)
unique(iris$Species)
table(iris$Species)

# ----------------------------------------------------------
# 3. Grouped analysis with dplyr
# ----------------------------------------------------------
library(dplyr)

iris_summary <- iris |>
  group_by(Species) |>
  summarise(
    count = n(),
    avg_sepal_length = mean(Sepal.Length),
    avg_sepal_width = mean(Sepal.Width),
    avg_petal_length = mean(Petal.Length),
    avg_petal_width = mean(Petal.Width),
    .groups = "drop"
  )
print(iris_summary)

# ----------------------------------------------------------
# 4. Visualize iris with ggplot2
# ----------------------------------------------------------
library(ggplot2)

iris_plot <- ggplot(iris,
  aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  geom_point(size = 2) +
  labs(title = "Sepal Length vs Petal Length",
       x = "Sepal Length", y = "Petal Length", color = "Species") +
  theme_minimal()
print(iris_plot)

# ----------------------------------------------------------
# 5. Explore mtcars
# ----------------------------------------------------------
data(mtcars)
head(mtcars)
str(mtcars)
summary(mtcars)

mtcars |> select(mpg, hp, wt) |> summary()

mtcars_plot <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(size = 2) +
  labs(title = "Vehicle Weight vs Fuel Economy",
       x = "Weight (1000 lbs)", y = "Miles per Gallon") +
  theme_minimal()
print(mtcars_plot)

# ----------------------------------------------------------
# 6. Check missing values with airquality
# ----------------------------------------------------------
data(airquality)
head(airquality)
str(airquality)

missing_values <- colSums(is.na(airquality))
print(missing_values)

rows_with_na <- airquality[!complete.cases(airquality), ]
head(rows_with_na)

# ----------------------------------------------------------
# 7. Small analysis workflow
# ----------------------------------------------------------
analysis_data <- iris

str(analysis_data)
summary(analysis_data)
print(colSums(is.na(analysis_data)))
print(table(analysis_data$Species))

analysis_summary <- analysis_data |>
  group_by(Species) |>
  summarise(
    observations = n(),
    mean_sepal_length = mean(Sepal.Length),
    mean_petal_length = mean(Petal.Length),
    .groups = "drop"
  )
print(analysis_summary)

analysis_plot <- ggplot(analysis_data,
  aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  geom_point() +
  theme_minimal()
print(analysis_plot)

# Workflow:
# Built-in Dataset -> Understand -> Inspect -> Validate
# -> Transform / Summarize -> Visualize -> Interpret

# ----------------------------------------------------------
# End of script
# ----------------------------------------------------------
print("23_built_in_datasets.R finished successfully")

