############################################################
# 19_import_export.R
# R Basic Manual
#
# Purpose:
# Learn how to import external data into R and export
# analysis results for use outside R.
#
# The basic workflow is:
# External Data -> Import -> Inspect -> Analyze -> Export
############################################################


# ----------------------------------------------------------
# 1. Understand data input and output
# ----------------------------------------------------------

# Import:
# Read data created outside R into the R environment.
#
# Export:
# Write data or analysis results from R to an external file.


# ----------------------------------------------------------
# 2. Check the working directory
# ----------------------------------------------------------

getwd()

# This chapter uses relative paths such as:
# data/sample_sales_19.csv
# output/analysis_result_19.csv
#
# Run the script from the repository root so these paths
# point to the correct locations.


# ----------------------------------------------------------
# 3. Import CSV files
# ----------------------------------------------------------

sales_data <- read.csv(
  "data/sample_sales_19.csv"
)

sales_data


# ----------------------------------------------------------
# 4. Inspect imported data
# ----------------------------------------------------------

head(sales_data)
str(sales_data)
summary(sales_data)
dim(sales_data)


# ----------------------------------------------------------
# 5. Import text files
# ----------------------------------------------------------

text_data <- read.table(
  "data/sample_sales_19.txt",
  header = TRUE,
  sep = "\t"
)

text_data


# ----------------------------------------------------------
# 6. Import Excel files
# ----------------------------------------------------------

# Run this once if readxl is not installed:
# install.packages("readxl")

library(readxl)

excel_data <- read_excel(
  "data/sample_sales_19.xlsx"
)

excel_data


# ----------------------------------------------------------
# 7. Handle file paths safely
# ----------------------------------------------------------

# Prefer relative paths inside a project:
csv_path <- "data/sample_sales_19.csv"

sales_from_path <- read.csv(csv_path)

head(sales_from_path)

# Avoid embedding a path that only works on one computer:
# "E:/R/R-Basic-Manual/data/sample_sales_19.csv"


# ----------------------------------------------------------
# 8. Export data to CSV
# ----------------------------------------------------------

dir.create(
  "output",
  showWarnings = FALSE
)

analysis_result <- aggregate(
  sales ~ category,
  data = sales_data,
  FUN = sum
)

analysis_result

write.csv(
  analysis_result,
  "output/analysis_result_19.csv",
  row.names = FALSE
)


# ----------------------------------------------------------
# 9. Export text files
# ----------------------------------------------------------

write.table(
  analysis_result,
  "output/analysis_result_19.txt",
  sep = "\t",
  row.names = FALSE,
  quote = FALSE
)


# ----------------------------------------------------------
# 10. Export Excel files
# ----------------------------------------------------------

# Run this once if writexl is not installed:
# install.packages("writexl")

library(writexl)

write_xlsx(
  analysis_result,
  "output/analysis_result_19.xlsx"
)


# ----------------------------------------------------------
# 11. Save and load R objects
# ----------------------------------------------------------

saveRDS(
  analysis_result,
  "output/analysis_result_19.rds"
)

loaded_result <- readRDS(
  "output/analysis_result_19.rds"
)

loaded_result


# ----------------------------------------------------------
# 12. Build a simple input/output workflow
# ----------------------------------------------------------

# Run this once if dplyr is not installed:
# install.packages("dplyr")

library(dplyr)

final_result <- read.csv(
  "data/sample_sales_19.csv"
) |>
  filter(
    !is.na(category),
    !is.na(sales)
  ) |>
  group_by(category) |>
  summarise(
    total_sales = sum(sales),
    average_sales = mean(sales),
    records = n(),
    .groups = "drop"
  ) |>
  arrange(desc(total_sales))

final_result

write.csv(
  final_result,
  "output/category_sales_summary_19.csv",
  row.names = FALSE
)


# ----------------------------------------------------------
# End of script
# ----------------------------------------------------------

print("19_import_export.R finished successfully")

