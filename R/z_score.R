#' Calculate z-score for standardization
#'
#' @param x a numeric vector
#'
#' @return a numeric vector standardized
#' @export
#'
#' @examples z_score(x = c(21, 15, 26, 26, 28, 29))
z_score <- function(x){
  (x - mean(x)) / sd(x)
}
