#' Transform Missing NA values to Zeros
#' @description Transform NA values to Zeros, which can be helpful
#'  in data cleaning for loss amounts
#'
#' @param df a data frame or indicated column of the data frame (named list)
#' @param ... a character vector optionally supplied as a c(...) vector
#' @source \url{http://stackoverflow.com/questions/2641653/pass-a-data-frame-column-name-to-a-function}
#' @return returns the column of interest with transformed missing NA values to 0
#' @export
#'
#' @examples
#' df = data.frame("x" = 1:3, "missings" = rep(NA, 3))
#' df$missings <- missing_to_zero(df, "missings")
missing_to_zero <- function(df, ...) {
  col = c(...)
  df[[col]][is.na(df[[col]])] <- 0

  cat("Confirming transformation...", head(df[[col]]))
  return(df[[col]])
}
