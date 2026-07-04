############################################################
# 10_functions.R
# R Basic Manual
#
# Purpose:
# Learn how to create reusable functions for data analysis.
############################################################

# ----------------------------------------------------------
# 1. Prepare sample data
# ----------------------------------------------------------

scores <- c(85, 90, 78, 92, 88)

scores


# ----------------------------------------------------------
# 2. Create a simple function
# ----------------------------------------------------------

say_hello <- function() {
  print("Hello from a function")
}

say_hello()


# ----------------------------------------------------------
# 3. Create a function with one argument
# ----------------------------------------------------------

calculate_average <- function(x) {
  mean(x)
}

calculate_average(scores)


# ----------------------------------------------------------
# 4. Create a function with return()
# ----------------------------------------------------------

calculate_total <- function(x) {
  total <- sum(x)
  return(total)
}

calculate_total(scores)


# ----------------------------------------------------------
# 5. Create a function with multiple arguments
# ----------------------------------------------------------

calculate_score_rate <- function(score, max_score) {
  rate <- score / max_score
  return(rate)
}

calculate_score_rate(85, 100)


# ----------------------------------------------------------
# 6. Create a function with a default argument
# ----------------------------------------------------------

add_bonus <- function(score, bonus = 5) {
  score + bonus
}

add_bonus(80)
add_bonus(80, bonus = 10)


# ----------------------------------------------------------
# 7. Use functions with a data frame
# ----------------------------------------------------------

students <- data.frame(
  id = c(1, 2, 3, 4, 5),
  name = c("Alice", "Bob", "Carol", "David", "Emma"),
  score = c(85, 90, 78, 92, 88)
)

students

calculate_average(students$score)
calculate_total(students$score)


# ----------------------------------------------------------
# 8. Create a reusable summary function
# ----------------------------------------------------------

summarize_scores <- function(x) {
  result <- data.frame(
    average = mean(x),
    total = sum(x),
    minimum = min(x),
    maximum = max(x)
  )
  
  return(result)
}

summarize_scores(scores)
summarize_scores(students$score)


# ----------------------------------------------------------
# 9. Reuse functions with different data
# ----------------------------------------------------------

scores_class_a <- c(85, 90, 78, 92, 88)
scores_class_b <- c(72, 80, 91, 86, 79)

calculate_average(scores_class_a)
calculate_average(scores_class_b)

summarize_scores(scores_class_a)
summarize_scores(scores_class_b)


# ----------------------------------------------------------
# End of script
# ----------------------------------------------------------

print("10_functions.R finished successfully")