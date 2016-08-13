#' Find columns that are similar duplicates
#' @description this function is a work in progress
#' @param df a object of class data frame
#' @param ... optional (TBD)
#'
#'
#'  \if{html}{\figure{franco.gif}}
#'
#' @return a string indicating if the columns are identical
#' @export
#'
#' @seealso \url{http://gph.is/1wtfLvZ}
same_same <- function(df, ...){
  tab = sapply(df, table)

  return(identical(tab, tab))

}

