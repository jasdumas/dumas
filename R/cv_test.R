#' Calculate the Cramer's V statistic
#'
#' @param x a numeric vector or matrix, or list to be compared against y
#' @param y a numeric vector or matrix, or list to be compared against x
#' @param ... optional arguements
#'
#' @return A list with class "htest"
#' @export
#'
#' @seealso \url{http://www.r-bloggers.com/example-8-39-calculating-cramers-v/}
cv_test = function(x, y, ...) {
  CV = sqrt(chisq.test(x, y, correct=FALSE)$statistic /
              (length(x) * (min(length(unique(x)),length(unique(y))) - 1)))
  print.noquote("Cramer V / Phi:")
  return(as.numeric(CV))
}
