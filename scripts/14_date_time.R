############################################################
# 14_date_time.R
# R Basic Manual
#
# Purpose:
# Learn how to handle date and time data in R.
#
# Real-world datasets often contain dates and timestamps
# such as order dates, registration dates, and event times.
# Converting, formatting, and calculating with date/time data
# is essential for time-based analysis.
############################################################

# ----------------------------------------------------------
# 1. Check the current date and time
# ----------------------------------------------------------

Sys.Date()
Sys.time()


# ----------------------------------------------------------
# 2. Create date objects
# ----------------------------------------------------------

order_date <- as.Date("2026-08-16")

order_date
class(order_date)


# ----------------------------------------------------------
# 3. Convert character data to Date
# ----------------------------------------------------------

date_text <- c("2026-08-01", "2026-08-05", "2026-08-10")

dates <- as.Date(date_text)

dates
class(dates)


# ----------------------------------------------------------
# 4. Format dates
# ----------------------------------------------------------

format(order_date, "%Y")
format(order_date, "%m")
format(order_date, "%d")
format(order_date, "%Y/%m/%d")
format(order_date, "%A")


# ----------------------------------------------------------
# 5. Add and subtract days
# ----------------------------------------------------------

order_date + 7
order_date - 7


# ----------------------------------------------------------
# 6. Calculate date differences
# ----------------------------------------------------------

start_date <- as.Date("2026-08-01")
end_date <- as.Date("2026-08-16")

end_date - start_date
difftime(end_date, start_date, units = "days")


# ----------------------------------------------------------
# 7. Create a sequence of dates
# ----------------------------------------------------------

date_sequence <- seq.Date(
  from = as.Date("2026-08-01"),
  to = as.Date("2026-08-07"),
  by = "day"
)

date_sequence


# ----------------------------------------------------------
# 8. Create time objects
# ----------------------------------------------------------

event_time <- as.POSIXct("2026-08-16 14:30:00")

event_time
class(event_time)


# ----------------------------------------------------------
# 9. Format date and time
# ----------------------------------------------------------

format(event_time, "%Y-%m-%d")
format(event_time, "%H:%M:%S")
format(event_time, "%Y-%m-%d %H:%M")


# ----------------------------------------------------------
# 10. Convert date columns in a data frame
# ----------------------------------------------------------

sales_data <- data.frame(
  order_id = c(1, 2, 3, 4),
  order_date = c("2026-08-01", "2026-08-03", "2026-08-05", "2026-08-08"),
  sales = c(450, 300, 520, 280),
  stringsAsFactors = FALSE
)

sales_data
str(sales_data)

sales_data$order_date <- as.Date(sales_data$order_date)

sales_data
str(sales_data)


# ----------------------------------------------------------
# 11. Extract time-based information
# ----------------------------------------------------------

sales_data$year <- format(sales_data$order_date, "%Y")
sales_data$month <- format(sales_data$order_date, "%m")
sales_data$weekday <- format(sales_data$order_date, "%A")

sales_data


# ----------------------------------------------------------
# 12. Calculate elapsed days
# ----------------------------------------------------------

reference_date <- as.Date("2026-08-10")

sales_data$days_since_order <- as.numeric(
  reference_date - sales_data$order_date
)

sales_data


# ----------------------------------------------------------
# 13. Filter data by date
# ----------------------------------------------------------

sales_data[
  sales_data$order_date >= as.Date("2026-08-05"),
]


# ----------------------------------------------------------
# 14. Summarize sales by date
# ----------------------------------------------------------

aggregate(
  sales ~ order_date,
  data = sales_data,
  sum
)


# ----------------------------------------------------------
# End of script
# ----------------------------------------------------------

print("14_date_time.R finished successfully")

