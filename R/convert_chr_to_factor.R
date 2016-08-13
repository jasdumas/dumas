#' convert character strings into factors
#' @description a work in progress
#' @param df a data frame
#' @param ... dataframe with characters
#'
#' @return a new data.frame
#' @export
#'
#' @examples
#' @details http://stackoverflow.com/a/2851213
convert_chr_to_factor <- function(df, ...){
  df <<- data.frame()
  df[] <- lapply(df, as.character)
  df <<- df
}
