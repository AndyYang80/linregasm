test_that("homoscedasticity() only accepts dataframe data", {
  expect_equal(homoscedasticity("X", "y ~ X"), list(NULL, NULL))
})

test_that("homoscedasticity() only accepts valid formulas", {
  expect_equal(homoscedasticity(
    tibble("X"=c(2,3,4), "y"=c(2,5,6)), "y = X"), list(NULL, NULL))
})

test_that("homoscedasticity() only accepts valid formulas", {
  expect_equal(homoscedasticity(
    tibble("X"=c(2,3,4), "y"=c(2,5,6)), "y ~ X")[[2]], 1)
})

test_that("homoscedasticity() only accepts valid formulas", {
  expect_true(is.ggplot(homoscedasticity(
    tibble("X"=c(2,3,4), "y"=c(2,5,6)), "y ~ X")[[1]]))
})
