#' Type less words for as.data.frame
#'
#' @param x a object to transform to a data.frame()
#'
#' @return a object of class data.frame
#' @export
#'
#' @examples class(adf(Orange$age))
adf <- function(x){
  as.data.frame(x)
}
