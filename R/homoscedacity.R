#' homoscedasticity
#'
#' This function recieves a linear regression model and outputs a
#' scatter plot figure of residuals plotted against fitted values. It prints
#' a statement indicating the results of the homoscedasticity test and outputs
#' a dataframe containing spearman correlation coefficients between the
#' absolute residuals and the fitted y values.
#'
#' @param X a dataframe containing predictor data
#' @param y a dataframe containing response data
#' @param threshold a float indicating rejection threshold of correlation coefficient
#'
#' @return a dataframe containing a correlation coefficient and p value
#' @export
#'
#' @examples
#' X <- tibble(c(1,2,3,4,5))
#' y <- tibble(c(1,2,4,4,6))
#' homoscedasticity(X, y)
#'
homoscedasticity <- function(X, y, threshold=0.05) {
}
