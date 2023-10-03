#' US PhD field of study diversity
#'
#' This dataset contains the information of the various fields of study currently
#' undertaken by the PhD graduates in the US. The fields of study have been classified
#' into "broad field", "major field" and "field" to introduce further granularity in the data.
#' The data encompasses all the number of PhD graduates in the US between the period of 2008-2017.
#'
#' @format A data frame with 3370 rows and 5 variables.
#' \describe{
#'   \item{broad_field}{Broad field of study}
#'   \item{major_field}{Major field of study within a broad field}
#'   \item{field}{Specific field of study within a major and a broad field}
#'   \item{year}{The year corresponding to the available data}
#'   \item{n_phds}{The number of PhD graduates for the corresponding year and field of study}

#' }
#' @examples
#' head(us_phd_field)
#'
#' @source \url{https://github.com/rfordatascience/tidytuesday/blob/master/data/2019/2019-02-19}
"us_phd_field"

library(tidyverse)
us_phd_field <- read_csv("data-raw/phd_by_field.csv")
usethis::use_data(us_phd_field, overwrite = TRUE)
