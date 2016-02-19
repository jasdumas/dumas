# http://stackoverflow.com/a/2851213

# create an empty data.frame in the global environment
df <- data.frame()

convert_chr_to_factor <- function(df, ...){
  df[] <- lapply(df, as.character)
  df <<- df
}