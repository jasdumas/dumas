## ---- Smoothing function - mean ----- ##
bin_smooth_mean <- function(x, bins) {
  lapply(x, function(x){ rep(mean(x), times = bins) })
}