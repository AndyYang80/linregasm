#' normality
#'
#' This function receives a linear regression model and p-value threshold
#' and outputs the p-value from a Shapiro wilks test along with a statement
#' indicating the results of the normality test
#'
#' @param data a dataframe containing regression data
#' @param formula a formula in the format "y ~ x1 + x2 + ..." indicating regression variables
#' @param p_threshold a p_value indicating rejection threshold of Shapiro wilks test
#'
#' @return a float of the p-value and a string with the word Pass or Fail depending on the results of the test
#' @export
#'
#' @examples
#' library(tibble)
#' normality(tibble("X"=c(2,3,4), "y"=c(2,5,6)), "y ~ X")
#'
normality <- function(data, formula, p_threshold=0.05) {

  if (typeof(data) != 'list'){
    stop("Error: data parameter must be a dataframe")
  }

  if (typeof(formula) != 'character' || !grepl("~", formula)){
    stop("Error: formula parameter has incorrect formatting, formula must be a string in the format Y ~ x1 + x2 + ..., or Y ~ .")
  }

  formula <- as.formula(formula)
  res <-  "Pass"
  linreg <- lm(formula, data = data)
  linreg_resid <- resid(linreg)
  p_value <- shapiro.test(linreg_resid)$p.value

  if (p_value >= p_threshold){
    res = "Pass"
    print("After applying the Shapiro Wilks test for normality of the residuals the regression assumption of normality has passed and you can continue with your analysis")
  }

  if(p_value < p_threshold){
    res = "Fail"
    print("After applying the Shapiro Wilks test for normality of the residuals the regression assumption of normality has failed and you should make some adjustments before continuing with your analysis")
  }

  return(list(p_value, res))
}
