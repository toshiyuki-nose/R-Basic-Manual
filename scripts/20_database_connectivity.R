############################################################
# 20_database_connectivity.R
# R Basic Manual
#
# Purpose:
# Learn how to connect R to a relational database,
# execute SQL queries, and use database data in an R
# analysis workflow.
#
# Workflow:
# Connect -> Query -> Import -> Analyze -> Disconnect
############################################################

# ----------------------------------------------------------
# 1. Why connect R to a database?
# ----------------------------------------------------------
# Real-world data is often stored in relational databases.

# ----------------------------------------------------------
# 2. Understand DBI and database drivers
# ----------------------------------------------------------
# install.packages("DBI")
# install.packages("RSQLite")
# install.packages("dplyr")
library(DBI)
library(RSQLite)
library(dplyr)

# ----------------------------------------------------------
# 3. Prepare a sample database
# ----------------------------------------------------------
database_path <- "data/sample_database_20.sqlite"
file.exists(database_path)

# ----------------------------------------------------------
# 4. Create a database connection
# ----------------------------------------------------------
con <- dbConnect(SQLite(), database_path)

# ----------------------------------------------------------
# 5. Check the connection
# ----------------------------------------------------------
dbIsValid(con)
dbListTables(con)
dbListFields(con, "sales")

# ----------------------------------------------------------
# 6. Read a database table
# ----------------------------------------------------------
sales_data <- dbReadTable(con, "sales")
head(sales_data)
str(sales_data)

# ----------------------------------------------------------
# 7. Execute a SQL query
# ----------------------------------------------------------
query_result <- dbGetQuery(con, "
  SELECT category, SUM(sales) AS total_sales
  FROM sales
  GROUP BY category
  ORDER BY total_sales DESC
")
query_result

# ----------------------------------------------------------
# 8. Filter data with SQL
# ----------------------------------------------------------
tokyo_sales <- dbGetQuery(con, "
  SELECT order_id, category, region, sales
  FROM sales
  WHERE region = 'Tokyo'
  ORDER BY sales DESC
")
tokyo_sales

# ----------------------------------------------------------
# 9. Import query results into R
# ----------------------------------------------------------
analysis_data <- dbGetQuery(con, "
  SELECT category, region, sales
  FROM sales
  WHERE sales >= 2000
")
analysis_data

# ----------------------------------------------------------
# 10. Analyze database data with dplyr
# ----------------------------------------------------------
analysis_summary <- analysis_data |>
  group_by(region) |>
  summarise(
    total_sales = sum(sales),
    average_sales = mean(sales),
    records = n(),
    .groups = "drop"
  ) |>
  arrange(desc(total_sales))
analysis_summary

# ----------------------------------------------------------
# 11. Use parameterized queries
# ----------------------------------------------------------
region_name <- "Osaka"
parameter_result <- dbGetQuery(
  con,
  "SELECT order_id, category, region, sales
   FROM sales
   WHERE region = ?
   ORDER BY sales DESC",
  params = list(region_name)
)
parameter_result

# ----------------------------------------------------------
# 12. Disconnect from the database
# ----------------------------------------------------------
dbDisconnect(con)
dbIsValid(con)

# ----------------------------------------------------------
# 13. Build a database analysis workflow
# ----------------------------------------------------------
con <- dbConnect(SQLite(), database_path)

final_result <- dbGetQuery(con, "
  SELECT category, region, sales
  FROM sales
") |>
  group_by(category) |>
  summarise(
    total_sales = sum(sales),
    average_sales = mean(sales),
    .groups = "drop"
  ) |>
  arrange(desc(total_sales))

final_result
dbDisconnect(con)

# ----------------------------------------------------------
# End of script
# ----------------------------------------------------------
print("20_database_connectivity.R finished successfully")

