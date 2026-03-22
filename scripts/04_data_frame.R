############################################################
# 04_data_frame.R
# R Basic Manual
#
# Purpose:
# Learn the basics of data frames in R.
############################################################

# ----------------------------------------------------------
# 1. Create a data frame
# ----------------------------------------------------------

students <- data.frame(
  id = c(1, 2, 3, 4, 5),
  name = c("Alice", "Bob", "Carol", "David", "Emma"),
  age = c(20, 21, 19, 22, 20),
  score = c(85, 90, 78, 92, 88)
)

students


# ----------------------------------------------------------
# 2. Check the structure
# ----------------------------------------------------------

class(students)
str(students)
dim(students)
nrow(students)
ncol(students)
names(students)


# ----------------------------------------------------------
# 3. Access columns
# ----------------------------------------------------------

students$name
students$score
students[, "age"]
students[, 4]


# ----------------------------------------------------------
# 4. Access rows
# ----------------------------------------------------------

students[1, ]
students[3, ]
students[1:3, ]


# ----------------------------------------------------------
# 5. Access specific rows and columns
# ----------------------------------------------------------

students[1:3, c("name", "score")]
students[, c("name", "age")]


# ----------------------------------------------------------
# 6. Filter rows by condition
# ----------------------------------------------------------

students[students$score >= 85, ]
students[students$age == 20, ]


# ----------------------------------------------------------
# 7. Add a new column
# ----------------------------------------------------------

students$passed <- students$score >= 80
students


# ----------------------------------------------------------
# 8. Create a new calculated column
# ----------------------------------------------------------

students$score_plus_5 <- students$score + 5
students


# ----------------------------------------------------------
# 9. Summary statistics
# ----------------------------------------------------------

mean(students$score)
max(students$score)
min(students$score)
summary(students)


# ----------------------------------------------------------
# 10. Sort rows
# ----------------------------------------------------------

students[order(students$score), ]
students[order(-students$score), ]


# ----------------------------------------------------------
# End of script
# ----------------------------------------------------------

print("04_data_frame.R finished successfully")

