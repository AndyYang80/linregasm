#' normality_test
#'
#' This function receives a linear regression model and p-value threshold
#' and outputs the p-value from a Shapiro wilks test along with a statement 
#' indicating the results of the normality test
#'
#' @param X a dataframe containing predictor data
#' @param y a dataframe containing response data
#' @param p_thresh a float indicating rejection threshold of the test.
#'
#' @return a float of the p-value
#' @export
#'
#' @examples
#' X <- tibble(c(1,2,3,4,5))
#' y <- tibble(c(1,2,4,4,6))
#' normality_test(X, y)
#'
normality_test <- function(X, y, p_thresh=0.05) {
}