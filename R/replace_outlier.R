#' Replace outliers in a dataset
#'
#' @param dataframe an object of class data.frame
#' @param cols specify columns
#' @param rows specify rows
#' @param newValue specify a new value to replace outliers with such as the mean of the column
#'
#' @return a data.frame is returned
#' @export
#' @details \url{http://sel-columbia.github.io/formhub.R/demo/RemoveOutliers.html}
outlierReplace = function(dataframe, cols, rows, newValue = NA) {
  if (any(rows)) {
    set(dataframe, rows, cols, newValue)
  }
}
