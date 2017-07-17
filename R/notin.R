#' Opposite of %in%
#'
#' @param x left match value comparison
#' @param table right match table comparison
#'
#' @return the values not in the table
#' @export
#'
#' @examples "xc5" %notin% letters
#' "c" %notin% letters
`%notin%` <- function (x, table) {
  !match(x, table, nomatch = 0L) > 0L
}
