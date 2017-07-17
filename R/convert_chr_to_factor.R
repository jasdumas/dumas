#' Convert character strings into factors
#' @description a work in progress
#' @param df a data frame
#' @param ... dataframe with characters
#'
#' @return a new data.frame
#' @export
#'
#' @examples  df = data.frame("H_member" = as.character(c("Jasmine", "Jenna", "Fiona")),
#'                            "current_age" = c(27, 27, 5))
#' convert_chr_to_factor(df)
#' @details http://stackoverflow.com/a/2851213
convert_chr_to_factor <- function(df, ...){
  df <- data.frame()
  df[] <- lapply(df, as.character)

  character_vars <- lapply(df, class) == "character"
  df[, character_vars] <- lapply(df[, character_vars], as.factor)
  return(df)
}
