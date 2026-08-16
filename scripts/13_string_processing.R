############################################################
# 13_string_processing.R
# R Basic Manual
#
# Purpose:
# Learn how to validate and clean character data
# using basic string processing techniques in R.
#
# Real-world data often contains inconsistent text values,
# extra spaces, different letter cases, and unwanted characters.
# String processing is an essential part of data cleaning
# and data management before analysis.
############################################################

# ----------------------------------------------------------
# 1. Prepare sample text data
# ----------------------------------------------------------

products <- c(" Coffee ", "GREEN TEA", "bread", "Chocolate Cake ")

products


# ----------------------------------------------------------
# 2. Count characters
# ----------------------------------------------------------

nchar(products)


# ----------------------------------------------------------
# 3. Combine strings
# ----------------------------------------------------------

product <- "Coffee"
region <- "Tokyo"

paste(product, region)
paste(product, region, sep = " - ")
paste0(product, "_", region)


# ----------------------------------------------------------
# 4. Change letter case
# ----------------------------------------------------------

toupper(products)
tolower(products)


# ----------------------------------------------------------
# 5. Remove extra spaces
# ----------------------------------------------------------

trimmed_products <- trimws(products)

trimmed_products


# ----------------------------------------------------------
# 6. Extract part of a string
# ----------------------------------------------------------

substr("Chocolate Cake", 1, 9)
substr(trimmed_products[1], 1, 3)


# ----------------------------------------------------------
# 7. Split strings
# ----------------------------------------------------------

product_code <- "FOOD-COFFEE-001"

strsplit(product_code, "-")


# ----------------------------------------------------------
# 8. Replace text
# ----------------------------------------------------------

product_names <- c("Green_Tea", "Chocolate_Cake", "Coffee")

gsub("_", " ", product_names)


# ----------------------------------------------------------
# 9. Search text
# ----------------------------------------------------------

products_clean <- trimws(products)

grep("Tea", products_clean, value = TRUE)
grepl("Cake", products_clean)


# ----------------------------------------------------------
# 10. Validate character data
# ----------------------------------------------------------

regions <- c("Tokyo", "Osaka", "Nagoya", "TOKYO", "Unknown")

valid_regions <- c("Tokyo", "Osaka", "Nagoya")

regions %in% valid_regions


# ----------------------------------------------------------
# 11. Clean character data in a data frame
# ----------------------------------------------------------

sales_data <- data.frame(
  product = c(" Coffee ", "GREEN TEA", "bread", "Chocolate Cake "),
  region = c("tokyo", "OSAKA", "Nagoya", "TOKYO"),
  stringsAsFactors = FALSE
)

sales_data

sales_data$product <- trimws(sales_data$product)
sales_data$product <- tolower(sales_data$product)

sales_data$region <- trimws(sales_data$region)
sales_data$region <- tolower(sales_data$region)

sales_data


# ----------------------------------------------------------
# 12. Standardize text values
# ----------------------------------------------------------

sales_data$product <- tools::toTitleCase(sales_data$product)
sales_data$region <- tools::toTitleCase(sales_data$region)

sales_data


# ----------------------------------------------------------
# 13. Validate cleaned data
# ----------------------------------------------------------

valid_regions <- c("Tokyo", "Osaka", "Nagoya")

sales_data$is_valid_region <- sales_data$region %in% valid_regions

sales_data


# ----------------------------------------------------------
# 14. Create labels from character data
# ----------------------------------------------------------

sales_data$label <- paste(
  sales_data$product,
  sales_data$region,
  sep = " - "
)

sales_data


# ----------------------------------------------------------
# End of script
# ----------------------------------------------------------

print("13_string_processing.R finished successfully")

