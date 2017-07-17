#' Multi-levels in a data.frame
#' Determine how many levels are in a data.frame
#' @param df a object of class data.frame
#' @param ... optional parameters supplied
#'
#' @return an object of class 'list' indicating the column name and the amount of levels
#' @export
#'
#' @examples
#' sample_df = data.frame("x" = rnorm(1:10),
#'                     "y" = rnorm(1:10),
#'                     "letters" = letters[1:10],
#'                     "gender" = c("M", "F"),
#'                     "pet" = c("spike", "spot", "fluffy", "mr. jingles", "rex") )
#'
#' multi_levels(df=sample_df)
multi_levels <- function(df, ...){
  cat("...computing levels\n")
  ### columns with a class of 'chr'
  # select columns that are character class into a new object
  selected_chr = df[, sapply(df, class) == "character"]
  # transform object(s) from chr to factor (to get levels)
  chr_to_factor = as.data.frame(sapply(selected_chr, factor))
  # get levels of each column
  lvl_chr = sapply(chr_to_factor, levels)
  # get length of each column
  length_chr = sapply(lvl_chr, length)
  # if there are atleast 1 column the length will be printed
  ifelse(length_chr > 0, print(length_chr), "")

  ### columns with a class 'factor' (similar process as above)
  selected_factor = as.data.frame(df[, sapply(df, class) == "factor"])
  lvl_factor = sapply(selected_factor, levels)
  length_factor = sapply(lvl_factor, length)
  ifelse(length_factor > 0, print(length_factor), "")

  #columns with a class 'numeric' or 'factor'
  selected_num = df[, sapply(df, class) == "numeric"]
  selected_num2 = df[, sapply(df, class) == "integer"]
  total_num = cbind(selected_num, selected_num2)
  ifelse(length(total_num) >= 0, paste0("There were also ", length(total_num), " numerical columns"), "")

}


