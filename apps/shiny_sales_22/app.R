############################################################
# app.R
# Chapter 22 - Shiny Basics
#
# Interactive Sales Analysis Dashboard
############################################################

library(shiny)

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


# ----------------------------------------------------------
# UI
# ----------------------------------------------------------

ui <- fluidPage(

  titlePanel("Sales Analysis Dashboard"),

  sidebarLayout(

    sidebarPanel(

      selectInput(
        "region",
        "Region:",
        choices = unique(sales_data$region),
        selected = "Tokyo"
      ),

      sliderInput(
        "minimum_sales",
        "Minimum Sales:",
        min = min(sales_data$sales),
        max = max(sales_data$sales),
        value = min(sales_data$sales),
        step = 100
      )
    ),

    mainPanel(

      h3("Summary"),
      textOutput("total_sales"),

      h3("Sales by Category"),
      plotOutput("sales_plot"),

      h3("Filtered Data"),
      tableOutput("sales_table")
    )
  )
)


# ----------------------------------------------------------
# Server
# ----------------------------------------------------------

server <- function(input, output, session) {

  filtered_data <- reactive({

    sales_data[
      sales_data$region == input$region &
        sales_data$sales >= input$minimum_sales,
    ]

  })

  output$total_sales <- renderText({

    total <- sum(filtered_data()$sales)

    paste(
      "Total Sales:",
      format(total, big.mark = ",")
    )

  })

  output$sales_plot <- renderPlot({

    data <- filtered_data()

    if (nrow(data) == 0) {
      plot.new()
      text(
        0.5,
        0.5,
        "No data matches the selected conditions."
      )
    } else {
      category_summary <- aggregate(
        sales ~ category,
        data = data,
        FUN = sum
      )

      barplot(
        category_summary$sales,
        names.arg = category_summary$category,
        main = "Sales by Category",
        xlab = "Category",
        ylab = "Sales"
      )
    }

  })

  output$sales_table <- renderTable({
    filtered_data()
  })

}


# ----------------------------------------------------------
# Start application
# ----------------------------------------------------------

shinyApp(
  ui = ui,
  server = server
)
