## ---- Smoothing function - median ----- ##
#' Bin smoothing by median
#'
#' @param x a numeric vector or list of numbers
#' @param bins a numeric vector of how many bins
#'
#' @return a list
#' @export
#'
#' @examples bin_smooth_median(x = c(21, 15, 26, 26, 28, 29), bins=2)
bin_smooth_median <- function(x, bins) {
  lapply(x, function(x){ rep(median(x), times = bins) })
}
