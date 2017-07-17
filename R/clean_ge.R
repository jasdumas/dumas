#' Clean Global Environment
#' Remove everything in your Global Environment except the function that does it
#'
#' @param pattern the name of the function
#'
#' @return nothing
#' @export
#' @seealso  url{http://stackoverflow.com/questions/4837477/remove-objects-in-globalenv-from-within-a-function}
#' @examples # clean_ge()
clean_ge <- function(pattern = "clean_ge") {
 objs <- ls(pos = ".GlobalEnv")
  # remove everything but this function
  rm(list = objs[-which(objs == pattern)], pos = ".GlobalEnv")
}
