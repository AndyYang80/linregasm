#' homoscedasticity
#'
#' This function recieves a linear regression model and outputs a
#' scatter plot figure of residuals plotted against fitted values. It prints
#' a statement indicating the results of the homoscedasticity test and outputs
#' a dataframe containing spearman correlation coefficients between the
#' absolute residuals and the fitted y values.
#'
#' @param data a dataframe containing regression data
#' @param formula a formula in the format "y ~ x1 + x2 + ..." indicating regression variables
#' @param threshold a float indicating rejection threshold of correlation coefficient
#'
#' @return a plot of predicted values vs residuals an the correlation p value
#' @export
#'
#' @examples
#' data <- tibble(X = c(1,2,3,4,5), y=c(1,2,4,4,6))
#' formula <- "y ~ X"
#' homoscedasticity(data, formula)
#'

library(tibble)
library(ggplot2)

homoscedasticity <- function(data, formula, threshold=0.05) {

  if (typeof(data) != 'list'){
    print("Error: data parameter must be a dataframe")
    return(list(NULL, NULL))
  }

  if (typeof(formula) != 'character' || !grepl("~", formula)){
    print("Error: formula parameter has incorrect formatting, formula must be a string in the format Y ~ x1 + x2 + ..., or Y ~ .")
    return(list(NULL, NULL))
  }

  formula <- as.formula(formula)
  linreg <- lm(formula, data = data)
  linreg.resid <- resid(linreg)
  linreg.preds <- predict(linreg)
  plot_data <- tibble("predicted" = linreg.preds, "residuals" = linreg.resid)

  resid_plot <- ggplot(plot_data, aes(x=predicted, y=residuals)) + geom_point() +
    geom_hline(yintercept = 0, linetype="dashed", color = "red") +
    ggtitle("Residuals vs predicted values") +
    ylab("Residuals") +
    xlab("Predicted")

  corr_res <- round(cor.test(linreg.resid, linreg.preds, method = "pearson")$p.value,3)

  print(paste0("The p value of the correlation between the predicted value and the residuals is: ", corr_res))

  if(corr_res > 0.05){
    cat("The p value of the correlation is above the rejection threshold, thus the correlation is likely not significant.
The data is likely to be homoscedastic if the cluster of points has similar width throughout the X axis on the residuals plot.")
  } else {
    cat("The p value of the correlation is below the rejection threshold, thus the correlation is likely significant.
The data is unlikely to be homoscedastic.")
  }

  return(list(resid_plot, corr_res))
}
