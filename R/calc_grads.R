#' Calculate the number of PhD graduates in the respective field
#'
#' @description
#' The function calculates the total number of PhD graduates for the input field of study present in the database. The input field must be a valid PhD field currently practiced in the US.
#'
#' @param field_name The field of research for which, we are interested to calculate the number of PhD graduates
#'
#' @examples
#' calc_grads("Agricultural economics")
#'
#' @return
#' The number of PhDs who have successfully graduated in a given field of study
#' @import tidyverse
#' @export


calc_grads <- function(field_name) {

  field_name <- trimws(field_name)
  if (tolower(field_name) %in% tolower(gradr::us_phd_field$field)){
  value <- gradr::us_phd_field |>
    group_by(field) |>
    summarise(total = sum(n_phds,na.rm = TRUE)) |>
    filter(tolower(field) == tolower(field_name))
  return(paste0("There are a total of ",value$total," PhD graduates in the US studying ",field_name))
  }
  else {
    return(paste0("Sorry ! ",field_name," is not a valid field of study according to the data of PhD graduates in the US"))
  }
  }
