#' US PhD diversity  R Shiny Application
#'
#' @description
#' Run US PhD field and gender diversity R Shiny Application from inst/myapp directory
#'
#' @return
#' A Shiny App embedded in the package
#'
#' @export

grad_app <- function() {
  app_dir <- system.file("myapp", package = "gradr")
  shiny::runApp(app_dir, display.mode = "normal")
}
