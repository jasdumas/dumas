#' Replace only the factors in a dataframe
#'
#' @param df object of class data.frame
#'
#' @return returns the dataframe with characters in place of factors
#' @export
#' @seealso \url{http://stackoverflow.com/a/2853231}
replace_only_factors <- function(df) {
  df_new <- data.frame(df)
  # locate the position in the data.frame where the class is factor
  i <- sapply(df_new, is.factor)
  # apply through the list of factors to character class
  df_new[i] <- lapply(df_new[i], as.character)
  # changes the global variable to exclude factors if data set exists as df in global envir.
  return(df_new)
}
