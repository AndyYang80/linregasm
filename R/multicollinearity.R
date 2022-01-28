#' multicollinearity
#'
#' his function recieves a data frame of predictors and outputs VIF for each feature
#'along with a stetement whether or not the multicollinearity assumption is violated.
#'
#' @param X a dataframe containing predictor data
#' @param threshold a float indicating threshold for VIF
#'
#' @return a dataframe containing VIF coefficients and a statement whether the assumption is violated.
#' @export
#'
#' @examples
#' library(tibble)
#' X <- tibble(c(1,2,3,4,5))
#' multicollinearity(X, 10)
#'
multicollinearity <- function(X, vif_threshold = 10) {
}
