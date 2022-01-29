test_that("multicollinearity() only accepts dataframe data", {
  expect_error(multicollinearity("X", "y ~ X"))
})

test_that("multicollinearity() only accepts valid formulas", {
  expect_error(multicollinearity(tibble("X"=c(2,3,4), "y"=c(2,5,6)), "y = X"))
})

#test_that("multicollinearity() with below values fails the normality test", {
#  expect_equal(round(multicollinearity(tibble("X1"=c(2, 3, 4),"X2"=c(-7, 8, 9), "X3" = c(30, 7, 8), "y"=c(2, 5, 6)), "y ~ X1+X2+X3")$VIF[1], 2), 4.92)
#})

#test_that("multicollinearity() with below values returns a p-value less than 0.05", {
#  expect_equal(round(multicollinearity(tibble("X1"=c(2, 3, 4),"X2"=c(-7, 8, 9), "X3" = c(30, 7, 8), "y"=c(2, 5, 6)), "y ~ X1+X2+X3")$VIF[3], 2), 831.20)
#})

test_that("multicollinearity() with below values fails the VIF test", {
  expect_equal(round(multicollinearity(mtcars, "mpg ~ hp + wt")$VIF[1], 2), 1.77)
})


