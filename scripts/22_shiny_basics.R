############################################################
# 22_shiny_basics.R
# R Basic Manual
#
# Purpose:
# Learn the basic structure of a Shiny application and
# understand interactive data analysis with R.
#
# Workflow:
# Input -> Reactive Processing -> Output
############################################################

# ----------------------------------------------------------
# 1. Install and load Shiny
# ----------------------------------------------------------

# Run this once if Shiny is not installed:
# install.packages("shiny")

library(shiny)


# ----------------------------------------------------------
# 2. Prepare sample data
# ----------------------------------------------------------

sales_data <- data.frame(
  category = c(
    "Books", "Electronics", "Food",
    "Books", "Electronics", "Food",
    "Books", "Electronics", "Food"
  ),
  region = c(
    "Tokyo", "Tokyo", "Tokyo",
    "Osaka", "Osaka", "Osaka",
    "Fukuoka", "Fukuoka", "Fukuoka"
  ),
  sales = c(
    2400, 2500, 1800,
    3000, 5000, 1500,
    1200, 4500, 2000
  )
)

sales_data


# ----------------------------------------------------------
# 3. Understand UI and Server
# ----------------------------------------------------------

# UI defines what the user sees.
ui <- fluidPage(
  titlePanel("My First Shiny App"),
  selectInput(
    "region",
    "Region:",
    choices = unique(sales_data$region)
  ),
  textOutput("selected_region")
)

# Server defines how the application responds.
server <- function(input, output, session) {

  output$selected_region <- renderText({
    paste("Selected region:", input$region)
  })

}


# ----------------------------------------------------------
# 4. Create the first Shiny application
# ----------------------------------------------------------

first_app <- shinyApp(
  ui = ui,
  server = server
)

# Run interactively if you want to test this small example:
# runApp(first_app)


# ----------------------------------------------------------
# 5. Understand reactive filtering
# ----------------------------------------------------------

# In a Shiny server function, reactive() can create data
# that automatically changes when an input changes.
#
# Example:
#
# filtered_data <- reactive({
#   sales_data[
#     sales_data$region == input$region &
#       sales_data$sales >= input$minimum_sales,
#   ]
# })
#
# Use filtered_data() to retrieve the current result.


# ----------------------------------------------------------
# 6. Run the completed application
# ----------------------------------------------------------

# The completed application for this chapter is stored in:
# apps/shiny_sales_22/app.R
#
# From the repository root, run:
#
# shiny::runApp("apps/shiny_sales_22")


# ----------------------------------------------------------
# End of script
# ----------------------------------------------------------

print("22_shiny_basics.R finished successfully")
