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
  character_vars <- lapply(df, class) == "character"
  df[, character_vars] <- lapply(df[, character_vars], as.factor)
  return(df)
}
