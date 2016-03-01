has.negative <- function(df, ...) {
  c = apply(df, 1, function(row) any(row < 0))
  
  if (length(which(c)) == 0) {
    paste("There is no negative values in this dataset.")
  } else {
    paste("There is ", length(which(c)), " negative values in this dataset.", 
          "These are the position(s) of the negative values: ", which(c), ".")
  }
  
  
}

# this wonkily returns two paster statements for each position of negative values found ?
# source: http://r.789695.n4.nabble.com/How-to-identify-the-rows-in-my-dataframe-with-a-negative-value-in-any-column-td823464.html

# has.neg <- apply(olddat, 1, function(row) any(row < 0))