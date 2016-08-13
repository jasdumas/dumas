how_many_classes <- function(df, ...){
  # get a character vector of variable names and class type
  This_many_classes = sapply(df, class)
  # remove variable names - now left with class type
  This_many_classes = unname(This_many_classes)
  # print out a count of each combination
  table(This_many_classes)
  
}