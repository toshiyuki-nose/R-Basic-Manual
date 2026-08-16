############################################################
# 12_matrix_list_factor.R
# R Basic Manual
#
# Purpose:
# Learn how to use matrices, lists, and factors in R.
############################################################

# ----------------------------------------------------------
# 1. Create a matrix
# ----------------------------------------------------------

scores_matrix <- matrix(
  c(85, 90, 78, 92, 88, 81),
  nrow = 2,
  ncol = 3,
  byrow = TRUE
)

scores_matrix


# ----------------------------------------------------------
# 2. Check matrix structure
# ----------------------------------------------------------

class(scores_matrix)
dim(scores_matrix)
nrow(scores_matrix)
ncol(scores_matrix)


# ----------------------------------------------------------
# 3. Access matrix elements
# ----------------------------------------------------------

scores_matrix[1, 1]
scores_matrix[2, 3]
scores_matrix[1, ]
scores_matrix[, 2]


# ----------------------------------------------------------
# 4. Basic matrix calculations
# ----------------------------------------------------------

sum(scores_matrix)
mean(scores_matrix)
rowMeans(scores_matrix)
colMeans(scores_matrix)


# ----------------------------------------------------------
# 5. Create a list
# ----------------------------------------------------------

student <- list(
  name = "Alice",
  age = 20,
  scores = c(85, 90, 88)
)

student


# ----------------------------------------------------------
# 6. Access list elements
# ----------------------------------------------------------

student$name
student$age
student$scores

student[["name"]]
student[[3]]


# ----------------------------------------------------------
# 7. Modify a list
# ----------------------------------------------------------

student$passed <- TRUE
student$age <- 21

student


# ----------------------------------------------------------
# 8. Create a factor
# ----------------------------------------------------------

grades <- c("A", "B", "A", "C", "B", "A")

grade_factor <- factor(grades)

grade_factor
class(grade_factor)
levels(grade_factor)


# ----------------------------------------------------------
# 9. Count factor levels
# ----------------------------------------------------------

table(grade_factor)


# ----------------------------------------------------------
# 10. Create an ordered factor
# ----------------------------------------------------------

satisfaction <- c("Low", "High", "Medium", "High", "Low")

satisfaction_factor <- factor(
  satisfaction,
  levels = c("Low", "Medium", "High"),
  ordered = TRUE
)

satisfaction_factor
levels(satisfaction_factor)


# ----------------------------------------------------------
# 11. Convert between data structures
# ----------------------------------------------------------

matrix_as_data_frame <- as.data.frame(scores_matrix)
matrix_as_data_frame

as.vector(scores_matrix)


# ----------------------------------------------------------
# 12. Use multiple data structures together
# ----------------------------------------------------------

analysis_result <- list(
  student = student,
  scores = scores_matrix,
  grades = grade_factor
)

analysis_result


# ----------------------------------------------------------
# End of script
# ----------------------------------------------------------

print("12_matrix_list_factor.R finished successfully")

