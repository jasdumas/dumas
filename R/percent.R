#' calculate a percentage
#'
#' calculate the percent of a list of numerical objects in R
#' @param df an object of class data.frame or list of numeric or double values
#'
#' @return "numeric"
#' @export
#'
#' @examples
#' df = c(1, 4, 6, 7, 3, 12)
#' percent(df)
percent = function(df) {(df/sum(df)) * 100}
