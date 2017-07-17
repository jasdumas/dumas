#' Find columns that are duplicates in a data frame
#'
#' @param df a object of class data.frame
#' @param message a object of class logical indicating to display a helper message
#'
#' @return return the data frame without duplicates
#'
#' @seealso \href{http://stackoverflow.com/questions/9818125/identifying-duplicate-columns-in-an-r-data-frame}{Stack Overflow Question}
#' @importFrom dplyr tbl_df
#' @examples a = data.frame(x=letters[1:5], y=letters[1:5], z=letters[6:10])
#' same_same(a)
#' @export
same_same <- function(df, message=TRUE){

  dups  = colnames(df[duplicated(as.list(df))])

  if(message){
    cat("The duplicate", length(dups) , "column(s) were: ", c(dups), "\n" )
  }

  if(nrow(df) < 500 & ncol(df) < 25) {
    # return a small data frame without duplicate columns
    return(df[!duplicated(as.list(df))])
  } else {
    # return a large data frame without duplicate columns
    #tbl_df for printing purposes
    return(tbl_df(df[!duplicated(as.list(df))]))
  }

}


