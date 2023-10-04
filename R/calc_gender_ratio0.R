#' Create the gender ratio plot without using the R shiny application
#'
#' @description
#' This function receives inputs similar to those from the US PhD diversity R shiny app
#' and creates an interactive plot to visualise the selected statistic for the chosen time period
#'
#'
#' @param input_stat Input for the selected statistic. The selected statistics can be "Gender_ratio","Prop_Male" and "Prop_Female"
#' @param input_event Input for the selected event period. The event periods can be "Pre 2000" or "Post 2000"
#'
#'
#' @import ggplot2
#' @import dplyr
#' @import shiny
#'
#' @export

calc_gender_ratio0 <- function(input_stat, input_event) {
  df_gender <- gradr::us_phd_gender

  df_gender_stats <-
    df_gender %>% mutate(
      Total = Male + Female,
      Prop_Female = Female / Total,
      Prop_Male = Male / Total,
      Gender_ratio = Female / Male
    )

  df_gender_stats <- df_gender_stats %>% filter(input_event == History)


  y_label <-
    if (input_stat == "Gender_ratio") {
      y_label <- "Gender ratio (Female:Male)"
    } else if (input_stat == "Prop_Female") {
      y_label <- "Proportion of females"
    } else if (input_stat == "Prop_Male") {
      y_label <- "Proportion of males"
    }


  pl4 <- ggplot(df_gender_stats, aes(x = Year, y = .data[[input_stat]])) +
    geom_point(color = "darkblue") +
    theme_classic() +
    theme(axis.text.x = element_text(size = 5, face = "bold", angle = 60)) +
    labs(x = "Year", y = y_label)
  pl4
}
