#' multicollinearity
#'
#' This function receives aan input dat, linear regression model and vif threshold, and outputs VIF for each feature
#'along with a statement whether or not the multicollinearity assumption is violated.
#'
#' @param data a dataframe containing predictor data
#' @param formula a formula in the format "y ~ x1 + x2 + ..." indicating regression variables
#' @param threshold a float indicating threshold for VIF
#'
#' @return a dataframe containing VIF coefficients and a statement whether the assumption is violated.
#' @export
#'
#' @examples
#' library(tibble)
#' data <- tibble(X = c(1,2,3,4,5))
#' formula <- "y ~ X"
#' multicollinearity(data, formula, 10)

library(tidyverse)

multicollinearity <- function(data, formula, vif_threshold = 10) {

  if (typeof(data) != 'list'){
    stop("Error: input data must be a dataframe")
  }

  if (typeof(formula) != 'character' || !grepl("~", formula)){
    stop("Error: formula parameter has incorrect formatting, formula must be a string in the format Y ~ x1 + x2 + ..., or Y ~ .")
  }

  formula <- as.formula(formula)
  linreg <- lm(formula, data = data)
  df_vif <- as_tibble(car::vif(linreg)) |>
    dplyr::rename(VIF = value)

  multicollinearity_cases <- df_vif |>
    filter(VIF > vif_threshold) |>
    nrow()

  if (multicollinearity_cases != 0){
    print("There is multicollinearity in your data. Consider removing features with high VIF")
  }

  return (df_vif)

}
