# code to import data from the URL and export to data folder

library(tidyverse)

URL <- "https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-02-19/phd_by_field.csv"

us_phd_field <- read_csv(URL)

usethis::use_data(us_phd_field, overwrite = TRUE)
