#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
if (interactive()) {

  # basic example
  shinyApp(
    ui = fluidPage(
      selectInput("variable", "Variable:",
                  c("Cylinders" = "cyl",
                    "Transmission" = "am",
                    "Gears" = "gear")),
      tableOutput("data")
    ),
    server = function(input, output) {
      output$data <- renderTable({
        mtcars[, c("mpg", input$variable), drop = FALSE]
      }, rownames = TRUE)
    }
  )

  # demoing group support in the `choices` arg
  shinyApp(
    ui = fluidPage(
      selectInput("state", "Choose a state:",
                  list(`East Coast` = list("NY", "NJ", "CT"),
                       `West Coast` = list("WA", "OR", "CA"),
                       `Midwest` = list("MN", "WI", "IA"))
      ),
      textOutput("result")
    ),
    server = function(input, output) {
      output$result <- renderText({
        paste("You chose", input$state)
      })
    }
  )
}
