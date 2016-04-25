# computes the KS test Statistic from a given list of integer variables

# previously used in shiny app
#load("P:\\shiny apps\\PL Monitoring\\class plan monitoring\\data_bin_more_vars.rds")

ks_all <- function(df, state, pre_date1, pre_date2, post_date1, post_date2, ...) {
  # pacakges
  library(dplyr)
  library(dumas) # on github: jasdumas/dumas
  library(reshape2)
  library(dgof)
  
  olddat = filter(df, STATE_ABBRV == state, PLCY_EFDT >= pre_date1, PLCY_EFDT <= pre_date2)
  olddat2 <<- olddat
  newdat = filter(df, STATE_ABBRV == state, PLCY_EFDT >= post_date1, PLCY_EFDT <= post_date2)
  newdat2 <<- newdat
  
  Result = list()
  count = 1
  intlst = c("PLCY_TERM_MONTH_CNT",
             "POL_BI_PER_PERSON_LIMIT_AMT",
             "POL_BI_PER_ACCIDENT_LIMIT_AMT",
             "random_variable")
  
  for (i in intlst) { 
    olddat2 =  olddat[, c(i, "EARNED_EXPOSURE")] 
    newdat2 =  newdat[, c(i, "EARNED_EXPOSURE")]
    
    # aggregate the df by sum of earned exposure
    olddat2 <- aggregate(EARNED_EXPOSURE ~ ., olddat2, sum)
    newdat2 <- aggregate(EARNED_EXPOSURE ~ ., newdat2 , sum)
    
    rownames(olddat2) = olddat2[[i]]
    olddat2[,i] = NULL
    
    rownames(newdat2) = newdat2[[i]]
    newdat2[,i] = NULL
    
    #olddat2$EARNED_EXPOSURE = as.numeric(olddat2$EARNED_EXPOSURE)

    #newdat2$EARNED_EXPOSURE = as.numeric(newdat2$EARNED_EXPOSURE)
    # earned exposure as percentages
    D = dgof::ks.test(x=olddat2$EARNED_EXPOSURE, 
                      y=newdat2$EARNED_EXPOSURE)
    D2 <<- D
    print(D)
    # plot distributions
    
    #par(mfrow=c(2, 2))
    
    plot(ecdf(olddat2$EARNED_EXPOSURE), xlim=range(olddat2$EARNED_EXPOSURE, newdat2$EARNED_EXPOSURE), col = "coral", 
         main = paste0("plot: ", i))
    plot(ecdf(newdat2$EARNED_EXPOSURE), add=TRUE, lty="dashed", col = "dodgerblue")
    
    # append to a list/data.frame
    Result[count] <- D$statistic
    count <- count + 1
    
  } # end of for loop
  print(Result)
  
  # sort the list by highest cramer's v value: Ref: http://stackoverflow.com/questions/13156448/how-can-i-sort-a-data-frame-with-only-one-column-without-losing-rownames
  tbl_view = t (  data.frame(Result) )
  row.names(tbl_view) = intlst
  colnames(tbl_view) = c("KS Statistic")
  tbl_view = tbl_view[order(tbl_view, decreasing = TRUE), , drop=FALSE]
  print(tbl_view)
} # end of function

ks_all(df = data_bin_more_vars, state = 'FL', 
       pre_date1 = '2015-01-01', pre_date2 = '2015-08-21', 
       post_date1 = '2015-08-22', post_date2 = '2016-01-31')
