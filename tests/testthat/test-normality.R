test_that("homoscedasticity() only accepts dataframe data", {
  expect_error(normality("X", "y ~ X"))
})

test_that("homoscedasticity() only accepts valid formulas", {
  expect_error(normality(tibble("X"=c(2,3,4), "y"=c(2,5,6)), "y = X"))
})

test_that("normality() with below values fails the normality test", {
  expect_equal(normality(tibble("X1"=c(2,3,4),"X2"=c(7,8,9), "y"=c(2,5,6)), "y ~ X1+X2")[[2]], "Fail")
})

test_that("normality() with below values returns a p-value less than 0.05", {
  expect_true(normality(tibble("X1"=c(2,3,4),"X2"=c(7,8,9), "y"=c(2,5,6)), "y ~ X1+X2")[[1]] < 0.05)
})



