#' Determine all NA columns
#'
#' @param x
#'
#' @return a string indicating the numeric column position where there
#'    are all NAs
#' @export
#'
#' @seealso \url{http://stackoverflow.com/a/11330265/4143444}
all_na <-  function (x) {
  w <- sapply(x, function(x)all(is.na(x)))
  if (any(w)) {
    paste("All NA in columns", paste(which(w), collapse=", "))
  } else {
    paste0("There is no column with all NA")
  }
}
