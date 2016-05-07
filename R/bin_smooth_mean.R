#' Bin smoothing by mean
#'
#' @param x a numeric vector or list of numbers
#' @param bins a numeric vector of how many bins
#'
#' @return a list
#' @export
#'
#' @examples bin_smooth_mean(x = c(21, 15, 26, 26, 28, 29), bins=2)
bin_smooth_mean <- function(x, bins) {
  lapply(x, function(x){ rep(mean(x), times = bins) })
}
