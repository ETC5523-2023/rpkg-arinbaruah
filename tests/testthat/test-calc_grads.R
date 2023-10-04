test_that("calc_grads calculates the correct value of PhD graduates in the US studying the field, test1", {


  field_name <- "Agricultural economics"

  test_grad<- paste0("There are a total of 1100 PhD graduates in the US studying ",field_name)

  x <- calc_grads(field_name)
  expect_equal(x,test_grad)

})


test_that("calc_grads calculates the correct value of PhD graduates in the US studying the field when input is all capital, test2", {


  field_name <- "AGRICULTURAL ECONOMICS"

  test_grad<- paste0("There are a total of 1100 PhD graduates in the US studying ",field_name)

  x <- calc_grads(field_name)
  expect_equal(x,test_grad)

})


test_that("calc_grads calculates the correct value of PhD graduates in the US studying the field when input is in mixed capitalisation, test3", {


  field_name <- "AgRIcULTuRAL eCoNOmIcS"

  test_grad<- paste0("There are a total of 1100 PhD graduates in the US studying ",field_name)

  x <- calc_grads(field_name)
  expect_equal(x,test_grad)

})

test_that("calc_grads calculates the correct value of PhD graduates in the US studying the field when there is a space as the first character of the argument, test4", {


  field_name <- " AgRIcULTuRAL eCoNOmIcS"

  test_grad<- paste0("There are a total of 1100 PhD graduates in the US studying",field_name)

  x <- calc_grads(field_name)
  expect_equal(x,test_grad)

})

test_that("calc_grads notifies the user of an invalid field name which does not match with any of the field of study in the dataset, test5", {


  field_name <- "Machine Learning"

  test_grad<- paste0("Sorry ! ",field_name," is not a valid field of study according to the data of PhD graduates in the US")

  x <- calc_grads(field_name)
  expect_equal(x,test_grad)

})

