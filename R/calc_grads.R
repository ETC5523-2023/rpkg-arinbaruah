#' Calculate the number of PhD graduates in the respective field
#'
#' @description
#' The function calculates the total number of PhD graduates for the input field of study present in the database. The input field must be a valid PhD field currently practiced in the US.
#'
#' @param x The field of research for which, we are interested to calculate the number of PhD graduates
#'
#' @return
#' The number of PhDs who have successfully graduate for a given field of study
#' @import dplyr
#'
#'
#' @examples
#' calc_grads("Agricultural economics")


calc_grads <- function(x) {
  value <- gradr::us_phd_field |> group_by(field) |>
    summarise(total = sum(n_phds)) |> filter(field == x)
  return(value$total)
}
