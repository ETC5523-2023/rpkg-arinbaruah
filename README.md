


# gradr

<div class="alert alert-block alert-warning">

🧑‍🎓🇺🇸👩‍🎓 
The `gradr` package is designed to study and explore the diversity among the PhD graduates in The United States. The purpose of this app is to:

1. study the number of PhD graduates over the time period of study,
2. study the educational diversity of the PhD graduates,
2. study the popular fields of study which yield PhD graduates, and 
3. study the change in gender diversity over the course of the study. 
</div>

# Installation

The development package of the `gradr` package can be installed on R through [Github](https://github.com/ETC5523-2023/rpkg-arinbaruah/tree/master). The following setup code can be used to install the package.

``` r
# installing the gradr package
devtools::install_github("ETC5523-2023/rpkg-arinbaruah")
```
# Loading the library

After a successful installation of the package, you can use the package through the code below.

``` r
# loading the library
library(gradr)
```

# Access the data for the PhD field of study in US

The `gradr` package includes a dataset `us_phd_field`, a dataframe with **3370 rows** and **5 variables**. The data can be obtained through the code chunk below:

``` r 
gradr::us_phd_field
```

Let us provide you with a glimpse of the dataset:

``` r
library(dplyr)
glimpse(us_phd_field)
```
You can refer to the documentation of the dataset through the codechunk below:

``` r
help("us_phd_field")
```

# Plot the gender diversity statistic without using the R shiny application

The package contains a function `calc_gender_ratio0` which allows to create a parametrised plot version of the R Shiny app to visualise the gender diversity statistic without launching the Shiny application. The function can be called using the code chunk below:

``` r 
calc_gender_ratio0(input_stat = "Gender_ratio",input_event = "Pre 2000")
```

# Calculate the number of graduates in a field of study

The package contains a function `calc_grads` to calculate the number of PhD graduates in a specific field of study without having to use the R shiny application. The argument of the function accepts a field of study currently undertaken in the US as per the data. The function can be used as follows: 

- `calc_grads()` : calculates the total number of PhD graduates for the input field of study present in the database. 

``` r
calc_grads("Agricultural economics")
```
For more details : `help(calc_grads)`

# More details

For a detailed documentation to use the package and explore its various functions, refer to the vignette which can be accessed in the [repository](https://github.com/ETC5523-2023/rpkg-arinbaruah/tree/master/vignettes). A link to the package website will be shared on this space shortly.  
