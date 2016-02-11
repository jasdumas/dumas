#http://sel-columbia.github.io/formhub.R/demo/RemoveOutliers.html

outlierReplace = function(dataframe, cols, rows, newValue = NA) {
  if (any(rows)) {
    set(dataframe, rows, cols, newValue)
  }
}