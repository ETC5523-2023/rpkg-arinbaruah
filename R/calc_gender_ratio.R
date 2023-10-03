#' Create the gender ratio plot
#'
#' @description
#' This function receives reactive inputs from the US PhD diversity R shiny app
#' and creates an interactive plot to visualise the selected statistic
#'
#'
#' @param input_stat Shiny user-interface input for the selected statistic
#' @param input_event Shiny user-interface input for the selected event date
#'
#' @importFrom  plotly ggplotly
#' @import ggplot2
#' @import dplyr
#' @import shiny
#'
#' @export

calc_gender_ratio <- function(input_stat, input_event) {
  df_gender <- gradr::us_phd_gender

  df_gender_stats <-
    df_gender %>% mutate(
      Total = Male + Female,
      Prop_Female = Female / Total,
      Prop_Male = Male / Total,
      Gender_ratio = Female / Male
    )

  df_gender_stats <- df_gender_stats %>% filter(input_event == History)


  y_label <- reactive({
    req(input_stat)
    if (input_stat == "Gender_ratio") {
      y_label <- "Gender ratio (Female:Male)"
    } else if (input_stat == "Prop_Female") {
      y_label <- "Proportion of females"
    } else if (input_stat == "Prop_Male") {
      y_label <- "Proportion of males"
    }
  })

  pl4 <- ggplot(df_gender_stats, aes(x = Year, y = .data[[input_stat]])) +
    geom_point(color = "darkblue") +
    theme_classic() +
    theme(axis.text.x = element_text(size = 5, face = "bold", angle = 60)) +
    labs(x = "Year", y = y_label())
  ggplotly(pl4)
}
