############################################################
# 08_data_cleaning.R
# R Basic Manual
#
# Purpose:
# Learn basic data cleaning techniques in R.
############################################################

# ----------------------------------------------------------
# 1. Create sample dirty data
# ----------------------------------------------------------

sales_dirty <- data.frame(
  id = c(1, 2, 3, 4, 5),
  product = c(" Coffee", "Tea ", "Bread", NA, "Cake"),
  sales = c("450", "300", "280", "520", NA),
  quantity = c(3, 2, NA, 2, 4),
  region = c("tokyo", "Osaka", "TOKYO", "Nagoya", "osaka"),
  stringsAsFactors = FALSE
)

sales_dirty


# ----------------------------------------------------------
# 2. Inspect the data
# ----------------------------------------------------------

str(sales_dirty)
summary(sales_dirty)


# ----------------------------------------------------------
# 3. Check missing values
# ----------------------------------------------------------

is.na(sales_dirty)
colSums(is.na(sales_dirty))


# ----------------------------------------------------------
# 4. Remove rows with missing values
# ----------------------------------------------------------

sales_no_na <- na.omit(sales_dirty)
sales_no_na


# ----------------------------------------------------------
# 5. Trim spaces in character columns
# ----------------------------------------------------------

sales_dirty$product <- trimws(sales_dirty$product)
sales_dirty


# ----------------------------------------------------------
# 6. Convert text to numeric
# ----------------------------------------------------------

sales_dirty$sales <- as.numeric(sales_dirty$sales)
sales_dirty


# ----------------------------------------------------------
# 7. Standardize text values
# ----------------------------------------------------------

sales_dirty$region <- tolower(sales_dirty$region)
sales_dirty


# ----------------------------------------------------------
# 8. Replace values
# ----------------------------------------------------------

sales_dirty$region[sales_dirty$region == "tokyo"] <- "Tokyo"
sales_dirty$region[sales_dirty$region == "osaka"] <- "Osaka"
sales_dirty$region[sales_dirty$region == "nagoya"] <- "Nagoya"

sales_dirty


# ----------------------------------------------------------
# 9. Fill missing numeric values
# ----------------------------------------------------------

sales_dirty$quantity[is.na(sales_dirty$quantity)] <- 0
sales_dirty


# ----------------------------------------------------------
# 10. Create new columns
# ----------------------------------------------------------

sales_dirty$is_missing_sales <- is.na(sales_dirty$sales)
sales_dirty


# ----------------------------------------------------------
# 11. Create category by condition
# ----------------------------------------------------------

sales_dirty$sales_level <- ifelse(
  sales_dirty$sales >= 400,
  "High",
  "Low"
)

sales_dirty


# ----------------------------------------------------------
# 12. Recheck structure
# ----------------------------------------------------------

str(sales_dirty)
summary(sales_dirty)


# ----------------------------------------------------------
# End of script
# ----------------------------------------------------------

print("08_data_cleaning.R finished successfully")

