#' convert character strings into factors
#'
#' @param df
#' @param ... dataframe with characters
#'
#' @return df
#' @export
#'
#' @examples
#' @details http://stackoverflow.com/a/2851213
convert_chr_to_factor <- function(df, ...){
  df <<- data.frame()
  df[] <- lapply(df, as.character)
  df <<- df
}
