#' Replace only the factors in a dataframe
#'
#' @param df object of class data.frame
#'
#' @return returns the dataframe with characters in place of factors
#' @export
#'
#' @examples
#' @details http://stackoverflow.com/a/2853231
replace_only_factors <- function(df) {
  # create an empty data.frame in the global environment
  df <<- data.frame()
  # locate the position in the data.frame where the class is factor
  i <- sapply(df, is.factor)
  # apply through the list of factors to character class
  df[i] <- lapply(df[i], as.character)
  # changes the global variable to exclude factors if data set exists as df in global envir.
  df <<- df
}
