test_that("calc_grads calculates the correct value of PhD graduates in the US studying the field, test1", {


  field_name <- "Agricultural economics"

  test_grad<- 1100

  x <- calc_grads(field_name)
  expect_equal(x,test_grad)

})


test_that("calc_grads calculates the correct value of PhD graduates in the US studying the field when input is all capital, test2", {


  field_name <- "AGRICULTURAL ECONOMICS"

  test_grad<- 1100

  x <- calc_grads(field_name)
  expect_equal(x,test_grad)

})


test_that("calc_grads calculates the correct value of PhD graduates in the US studying the field when input is in mixed capitalisation, test3", {


  field_name <- "AgRIcULTuRAL eCoNOmIcS"

  test_grad<- 1100

  x <- calc_grads(field_name)
  expect_equal(x,test_grad)

})

test_that("calc_grads calculates the correct value of PhD graduates in the US studying the field when input is in mixed capitalisation, test4", {


  field_name <- " AgRIcULTuRAL eCoNOmIcS"

  test_grad<- 1100

  x <- calc_grads(field_name)
  expect_equal(x,test_grad)

})
