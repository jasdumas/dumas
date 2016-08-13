#' Check your sanity and the length or rows for equality
#' @description After creating train and test datasets in ML, check to make
#'  sure that the correponsing weights, or response vectors are the same
#'  amount of observations as the original dataset.
#' @param check1 a object of class data.frame, character, or numeric
#' @param check2 a object of class data.frame, character, or numeric
#' @param ... optional arguements passed through (TBD)
#'
#' @return a string indicating the success of the comparison or
#'  failure of equality of observations form both input objects
#' @export
#'
#' @examples sanity_check(iris, iris)
#' sanity_check(iris, cars)
sanity_check <- function(check1, check2, ...){
  to_check = c(...)
  # compare two arguements are data frames
  if(is.data.frame(check1) & is.data.frame(check2)){

    if (nrow(check1) == nrow(check2)) {
      print("Good: Same number of rows.")
    } else{
      print("Bad: Not the same number of rows.")
    }
  # if the two arguements are character vectors
  } else if (is.character(check1) & is.character(check2)){

    if (length(check1) == length(check2)) {
      print("Good: Same number of rows.")
    } else{
      print("Bad: Not the same number of rows.")
    }
  #  if there are mixed df and vector
  } else if (is.data.frame(check1) & is.character(check2)){

    if (nrow(check1) == length(check2)) {
      print("Good: Same number of rows.")
    } else{
      print("Bad: Not the same number of rows.")
    }
  #  if there are mixed df and vector
  } else if (is.data.frame(check2) & is.character(check1)) {

    if (nrow(check2) == length(check1)) {
      print("Good: Same number of rows.")
    } else{
      print("Bad: Not the same number of rows.")
    }

    # if the two arguements are numeric vectors
  } else if (is.numeric(check1) & is.numeric(check2)){

    if (length(check1) == length(check2)) {
      print("Good: Same number of rows.")
    } else{
      print("Bad: Not the same number of rows.")
    }
    #  if there are mixed df and vector
  } else if (is.data.frame(check1) & is.numeric(check2)){

    if (nrow(check1) == length(check2)) {
      print("Good: Same number of rows.")
    } else{
      print("Bad: Not the same number of rows.")
    }
    #  if there are mixed df and vector
  } else if (is.data.frame(check2) & is.numeric(check1)) {

    if (nrow(check2) == length(check1)) {
      print("Good: Same number of rows.")
    } else{
      print("Bad: Not the same number of rows.")
    }

  }

}
