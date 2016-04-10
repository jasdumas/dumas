#' Title
#'
#' This opens a dataset in a tempfile in excel for cleaner visuals of the data
#' @param x dataset or object of class data.frame
#' @param file default file append
#'
#' @return "press enter to continue..."
#' @export
#'
#' @examples
#' open.this()
#' @seealso
#' Function graciously acquired from Garrett Dancik, PhD @ ECSU
open.this <-function(x, file = "__tmp.csv") {
  write.table(x, file = file, sep = ",", row.names = TRUE, col.names = NA)
  cmd = paste("open ", file, sep = "")
  system(cmd)
  cat("press enter to continue...\n")
  scan()
  cmd = paste("rm ", file, sep = "")
  system(cmd)
}
