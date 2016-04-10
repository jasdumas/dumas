#' cbind.fill
#'
#' returns a data.frame joined by columns but filled with NA's if the values are missing
#' @param ... data.frame objects needed to be combined by columns
#'
#' @return a data.frame
#' @export
#'
#' @examples
#' x = data.frame("x1" = c(1, 2, 3))
#' y = data.frame("x1" = c(1, 2), "y1" = c(1, 2))
#' cbind.fill(x, y)
#' @seealso
#' http://stackoverflow.com/questions/7962267/cbind-a-df-with-an-empty-df-cbind-fill
cbind.fill <- function(...){
  nm <- list(...)
  nm <- lapply(nm, as.matrix)
  n <- max(sapply(nm, nrow))
  do.call(cbind, lapply(nm, function (x)
    rbind(x, matrix(, n-nrow(x), ncol(x)))))
}
