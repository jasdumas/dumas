#' example Cramer's V function
#' 
#' computes the Cramer's V statisitc with dummy data using the lsr funciton and a hand equation
#'
#' @return
#' @export
#'
#' @examples
#' example_cv_func()
example_cramersV_hand <- function(){
  # Consider an experiment with two conditions, each with 100 
  # participants. Each participant chooses between one of three
  # options. Possible data for this experiment:
  
  condition1 <- c(30, 20, 50) 
  condition2 <- c(35, 30, 35)
  X <- cbind( condition1, condition2 )
  rownames(X) <- c( 'choice1', 'choice2', 'choice3' )
  #print(X)
  
  # To test the null hypothesis that the distribution of choices
  # is identical in the two conditions, we would run a chi-square
  # test:
  x2 = chisq.test(X)
  # # # # # # # # # 
  #  lsr equation 
  # # # # # # # # # 
  # To estimate the effect size we can use Cramer's V:
  library(lsr)
  cv = cramersV( X )  # returns a value of 0.159
  print(paste0("this is the lsr value: ", cv))
  
  
  # # # # # # # # # 
  #  hand equation 
  # # # # # # # # # 
  x2 = chisq.test( X )  # derived from the pearson's chi-squared test
  n = sum(x2$observed)  # sum number of observations
  k = ncol(X)-1  # number of columns -1
  r = nrow(as.data.frame(X)) -1  # number of rows -1
  
  denom = min(k, r)
  numerator = x2$statistic/n
  
  V = sqrt((numerator  /  denom)) ### this is how the lsr package function is creating cramer's v
  
  print(paste0("this is the hand calculation value: ", V))
}

#example_cramersV_hand()
