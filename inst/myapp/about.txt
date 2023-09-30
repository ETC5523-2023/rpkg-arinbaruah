
#### 💡 Data

The application is based on the data for PhD graduates in the country of The United States between the period of 2008-2017. The data contains a range of variables such as the graduating year, broad and major fields of study. The data has been sourced from the [TidyTuesday](https://github.com/rfordatascience/tidytuesday/tree/master/data/2019/2019-02-19) repository. The data has been curated by the __National Science Foundation (NSF)__ in The United States.

In order to enhance the study further and add improved perspectives, an additional dataset was sourced which contained the gender composition data of the PhD graduates in The United States. The data has been sourced from __The National Center for Education Statistics (NCES)__. 



#### 🎯 Purpose

The purpose of the app is to:

1. study the number of PhD graduates over the time period of study,
2. study the educational diversity of the PhD graduates,
2. study the popular fields of study which yield PhD graduates, and 
3. study the change in gender diversity amongst the graduates over the period of time. 

The data obtained was observed to show a constant growth in the number of PhD graduates in The US. Additionally, this has led to a corresponding growth in the fields of study as unique fields of study are now generated. The data has further suggested an encouraging trend towards gender equality among PhD graduates since the year of 1950 to 2019. The app used interactive components to see how the choices in plot elements effect the visibility of these features and provide deeper insights in the process.

#### 🕵️‍♂️Creator

Arindom Baruah (abar0090@student.monash.edu) \
Masters of Business Analytics (MBAT) \
ID: 32779267

<details>
<summary>Session information</summary>

```
## ─ Session info ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
##  setting  value
##  version  R version 4.3.0 (2023-04-21)
##  os       macOS Ventura 13.4.1
##  system   x86_64, darwin20
##  ui       RStudio
##  language (EN)
##  collate  en_US.UTF-8
##  ctype    en_US.UTF-8
##  tz       Australia/Melbourne
##  date     2023-08-24
##  rstudio  2023.06.1+524 Mountain Hydrangea (desktop)
##  pandoc   3.1.1 @ /Applications/RStudio.app/Contents/Resources/app/quarto/bin/tools/ (via rmarkdown)
## 
## ─ Packages ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
##  package      * version date (UTC) lib source
##  bit            4.0.5   2022-11-15 [1] CRAN (R 4.3.0)
##  bit64          4.0.5   2020-08-30 [1] CRAN (R 4.3.0)
##  bslib          0.5.0   2023-06-09 [1] CRAN (R 4.3.0)
##  cachem         1.0.8   2023-05-01 [1] CRAN (R 4.3.0)
##  cli            3.6.1   2023-03-23 [1] CRAN (R 4.3.0)
##  colorspace     2.1-0   2023-01-23 [1] CRAN (R 4.3.0)
##  crayon         1.5.2   2022-09-29 [1] CRAN (R 4.3.0)
##  data.table     1.14.8  2023-02-17 [1] CRAN (R 4.3.0)
##  digest         0.6.33  2023-07-07 [1] CRAN (R 4.3.0)
##  dplyr        * 1.1.2   2023-04-20 [1] CRAN (R 4.3.0)
##  ellipsis       0.3.2   2021-04-29 [1] CRAN (R 4.3.0)
##  evaluate       0.21    2023-05-05 [1] CRAN (R 4.3.0)
##  fansi          1.0.4   2023-01-22 [1] CRAN (R 4.3.0)
##  fastmap        1.1.1   2023-02-24 [1] CRAN (R 4.3.0)
##  forcats      * 1.0.0   2023-01-29 [1] CRAN (R 4.3.0)
##  generics       0.1.3   2022-07-05 [1] CRAN (R 4.3.0)
##  ggplot2      * 3.4.2   2023-04-03 [1] CRAN (R 4.3.0)
##  ggthemes     * 4.2.4   2021-01-20 [1] CRAN (R 4.3.0)
##  glue           1.6.2   2022-02-24 [1] CRAN (R 4.3.0)
##  gtable         0.3.3   2023-03-21 [1] CRAN (R 4.3.0)
##  here         * 1.0.1   2020-12-13 [1] CRAN (R 4.3.0)
##  hms            1.1.3   2023-03-21 [1] CRAN (R 4.3.0)
##  htmltools      0.5.5   2023-03-23 [1] CRAN (R 4.3.0)
##  htmlwidgets    1.6.2   2023-03-17 [1] CRAN (R 4.3.0)
##  httpuv         1.6.11  2023-05-11 [1] CRAN (R 4.3.0)
##  httr           1.4.6   2023-05-08 [1] CRAN (R 4.3.0)
##  jquerylib      0.1.4   2021-04-26 [1] CRAN (R 4.3.0)
##  jsonlite       1.8.7   2023-06-29 [1] CRAN (R 4.3.0)
##  knitr          1.43    2023-05-25 [1] CRAN (R 4.3.0)
##  later          1.3.1   2023-05-02 [1] CRAN (R 4.3.0)
##  lazyeval       0.2.2   2019-03-15 [1] CRAN (R 4.3.0)
##  lifecycle      1.0.3   2022-10-07 [1] CRAN (R 4.3.0)
##  lubridate    * 1.9.2   2023-02-10 [1] CRAN (R 4.3.0)
##  magrittr       2.0.3   2022-03-30 [1] CRAN (R 4.3.0)
##  markdown       1.7     2023-05-16 [1] CRAN (R 4.3.0)
##  memoise        2.0.1   2021-11-26 [1] CRAN (R 4.3.0)
##  mime           0.12    2021-09-28 [1] CRAN (R 4.3.0)
##  munsell        0.5.0   2018-06-12 [1] CRAN (R 4.3.0)
##  pillar         1.9.0   2023-03-22 [1] CRAN (R 4.3.0)
##  pkgconfig      2.0.3   2019-09-22 [1] CRAN (R 4.3.0)
##  plotly       * 4.10.2  2023-06-03 [1] CRAN (R 4.3.0)
##  promises       1.2.0.1 2021-02-11 [1] CRAN (R 4.3.0)
##  purrr        * 1.0.1   2023-01-10 [1] CRAN (R 4.3.0)
##  R6             2.5.1   2021-08-19 [1] CRAN (R 4.3.0)
##  RColorBrewer * 1.1-3   2022-04-03 [1] CRAN (R 4.3.0)
##  Rcpp           1.0.11  2023-07-06 [1] CRAN (R 4.3.0)
##  readr        * 2.1.4   2023-02-10 [1] CRAN (R 4.3.0)
##  rlang          1.1.1   2023-04-28 [1] CRAN (R 4.3.0)
##  rmarkdown      2.23    2023-07-01 [1] CRAN (R 4.3.0)
##  rprojroot      2.0.3   2022-04-02 [1] CRAN (R 4.3.0)
##  rsconnect      1.0.1   2023-07-20 [1] CRAN (R 4.3.0)
##  rstudioapi     0.15.0  2023-07-07 [1] CRAN (R 4.3.0)
##  sass           0.4.7   2023-07-15 [1] CRAN (R 4.3.0)
##  scales         1.2.1   2022-08-20 [1] CRAN (R 4.3.0)
##  sessioninfo    1.2.2   2021-12-06 [1] CRAN (R 4.3.0)
##  shiny        * 1.7.4.1 2023-07-06 [1] CRAN (R 4.3.0)
##  shinythemes  * 1.2.0   2021-01-25 [1] CRAN (R 4.3.0)
##  shinyWidgets * 0.7.6   2023-01-08 [1] CRAN (R 4.3.0)
##  stringi        1.7.12  2023-01-11 [1] CRAN (R 4.3.0)
##  stringr      * 1.5.0   2022-12-02 [1] CRAN (R 4.3.0)
##  tibble       * 3.2.1   2023-03-20 [1] CRAN (R 4.3.0)
##  tidyr        * 1.3.0   2023-01-24 [1] CRAN (R 4.3.0)
##  tidyselect     1.2.0   2022-10-10 [1] CRAN (R 4.3.0)
##  tidyverse    * 2.0.0   2023-02-22 [1] CRAN (R 4.3.0)
##  timechange     0.2.0   2023-01-11 [1] CRAN (R 4.3.0)
##  tzdb           0.4.0   2023-05-12 [1] CRAN (R 4.3.0)
##  utf8           1.2.3   2023-01-31 [1] CRAN (R 4.3.0)
##  vctrs          0.6.3   2023-06-14 [1] CRAN (R 4.3.0)
##  viridisLite    0.4.2   2023-05-02 [1] CRAN (R 4.3.0)
##  vroom          1.6.3   2023-04-28 [1] CRAN (R 4.3.0)
##  withr          2.5.0   2022-03-03 [1] CRAN (R 4.3.0)
##  xfun           0.39    2023-04-20 [1] CRAN (R 4.3.0)
##  xtable         1.8-4   2019-04-21 [1] CRAN (R 4.3.0)
##  yaml           2.3.7   2023-01-23 [1] CRAN (R 4.3.0)
## 
##  [1] /Library/Frameworks/R.framework/Versions/4.3-x86_64/Resources/library
## 
## ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
```
</details>
