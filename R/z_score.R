# function to code data from x to u (z score)
# original source: source('~/Desktop/R-directory/coded_x_u.R', echo=TRUE)
z_score <- function(x){
  (x - mean(x)) / sd(x)
}