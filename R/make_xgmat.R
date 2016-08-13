#' Create a Sparse matrix for xgboost
#'
#' @param data an object of class data.frame or tbl.df
#' @param train_label a object of class numeric
#' @param test_label a object of class numeric
#' @param type a object of class string
#' @param ... optional arguements
#'
#' @return return a xgb.Matrix to the Global environment
#' @export
#'
#' @examples make_xgmat(traindat, train_label)
make_xgmat <- function(data, label,  ...) {
  # extract out characters and factors for determining level amounts  
  select_cat_vars <- data[, sapply(data, is.character) | sapply(data, is.factor)]
  # huge list of the unique levels
  unique_cat <- apply(select_cat_vars, 2, unique) 
  # huge list of colname & amount of unique levels
  l_uni <- sapply(unique_cat, length) 
  # for cols with 2 or more levels of factors
  more_than_2_lvls <- select_cat_vars[, c(which(l_uni >= 2))] 
  # http://stackoverflow.com/a/29759867/4143444
  mm <- more_than_2_lvls[, sapply(more_than_2_lvls, function(col) length(unique(col))) > 1]
  try <- mm[sapply(mm, function(x) !is.factor(x) | nlevels(x) > 1)]
  # add numerical cols back in back
  agg_full_table <- data.frame(try, data[, sapply(data, is.numeric)])
  # make labels numeric and not a list by unlisting them
  label = unlist(label)
  
  return(xgb.DMatrix(as.matrix(sapply(agg_full_table, as.numeric)), label=label, missing = NA)) 
    
}

