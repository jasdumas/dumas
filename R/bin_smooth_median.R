## ---- Smoothing function - median ----- ##
bin_smooth_median <- function(x, bins) {
  lapply(x, function(x){ rep(median(x), times = bins) })
}