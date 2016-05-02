#' #' Cramer's V calculation 
#' #' 
#' #' A loop method for a data.frame object using the function from the lsr package
#' #'
#' #' @param df A object of class data.frame.
#' #' @param state A object of class character; two uppercase state abbreviation letter e.g. "NY".
#' #' @param pre_date1 A object of class character; can be pre-processed from the lubridate package e.g. '2016-04-12'.
#' #' @param pre_date2 A object of class character; can be pre-processed from the lubridate package e.g. '2016-04-12'.
#' #' @param post_date1 A object of class character; can be pre-processed from the lubridate package e.g. '2016-04-12'.
#' #' @param post_date2 A object of class character; can be pre-processed from the lubridate package e.g. '2016-04-12'.
#' #' @param varlst A object of class character; list of variable column names to be calculated on.
#' #' @param ... further arguments passed to or from other methods.
#' #'
#' #' @return
#' #' Returns a data.frame of percentages for new and old data ranges for each variable. Returns a data.frame with a ranked Cramer's V value.
#' #' @export
#' #' 
#' #' @seealso 
#' #' \href{https://cran.r-project.org/web/packages/lsr/lsr.pdf}{lsr package}
#' #' 
#' #' @examples
#' #' cv_all(df = data_bin_more_vars, state = 'FL', pre_date1 = '2015-01-01', pre_date2 = '2015-08-21', post_date1 = '2015-08-22', post_date2 = '2016-01-31', varlst = c("PRIOR_CARR_BI_PERSON_LMT"))
#' 
#' cv_all <- function(df, state, pre_date1, pre_date2, post_date1, post_date2, varlst, ...) {
#'   # packages
#'   library(dplyr)
#'   library(lsr)
#'   library(dumas) # on github: jasdumas/dumas
#'   library(reshape2)
#'   library(data.table)
#'   # Start the clock!
#'   start = ptm <- proc.time() 
#'   # turn df into a data.table for faster filtering?
#'   #df = data.table::data.table(df)
#'   # data partition into two groups
#'   olddat = filter(df, STATE_ABBRV == state, PLCY_EFDT >= pre_date1, PLCY_EFDT <= pre_date2)
#'   newdat = filter(df, STATE_ABBRV == state, PLCY_EFDT >= post_date1, PLCY_EFDT <= post_date2)
#'   # initially empty list, will get vales appended to list and then sorted
#'   Result = list()
#'   # increment count of list by loop iteration
#'   count = 1
#'   # loop through provided variable list
#'   for (i in varlst) { 
#'     # partition data by ith variable and exposure column
#'     olddat2 =  olddat[, c(i, "EARNED_EXPOSURE")] 
#'     newdat2 =  newdat[, c(i, "EARNED_EXPOSURE")]
#'     # aggregate by the sum of the earned exposure
#'     olddat2 <- aggregate(EARNED_EXPOSURE ~ ., olddat2, sum)
#'     newdat2 <- aggregate(EARNED_EXPOSURE ~ ., newdat2 , sum)
#'     # create a new copy of the data set
#'     olddat3 = olddat2
#'     newdat3 = newdat2
#'     # calculate percentages, then add to new data frame
#'     olddat3$percent_old = as.double(percent(olddat2$EARNED_EXPOSURE))
#'     newdat3$percent_new = as.double(percent(newdat2$EARNED_EXPOSURE))
#'     # create a new numeric vector with EE to be striped out in plot_fix_reactive()
#'     olddat_EE = olddat2$EARNED_EXPOSURE
#'     newdat_EE = newdat2$EARNED_EXPOSURE
#'     print(olddat_EE)
#'     # remove EARNED_EXPOSURE COLS
#'     olddat3$EARNED_EXPOSURE = NULL
#'     newdat3$EARNED_EXPOSURE = NULL
#'     # full join percentages together with NA inputed for missing values
#'     p = dplyr::full_join(olddat3, newdat3)
#'     
#'     #############
#'     row.names(p) = levels(as.factor(p[, i]))
#'     #p = na.omit(p[!(p[2:3] < 0.3), ])
#'     # append the vectors back to the data set label 
#'     library(dumas)
#'     p3 = p # make a copy
#'     p = na.omit(p[!(p[2:3] < 0.3), ]) # original
#'     p3 = dumas::cbind.fill(p3, as.numeric(olddat_EE))
#'     p3 = dumas::cbind.fill(p3, as.numeric(newdat_EE))
#'     p3 = as.data.frame(p3)
#'     p3[, 2] = as.numeric(as.character(p3[, 2]))
#'     p3[, 3] = as.numeric(as.character(p3[, 3]))
#'     p3[, 4] = as.numeric(as.character(p3[, 4]))
#'     p3[, 5] = as.numeric(as.character(p3[, 5]))
#'     
#'     View(p3)
#'     p4 <<- p3
#'     #   p[is.na(p)] <- 0
#'     #   p = as.data.frame(p)
#'     #   p = as.numeric(p[, c(2, 3, 4, 5)])
#'     #   
#'     View(p)
#'     #   p3 = p[1:3]
#'     #   p3 = na.omit(p3[!(p3[2:3] < 0.3), ])
#'     #  # print output
#'     # View(p3)
#'     # plotly pre-processing
#'     #pf = melt(data = p)
#'     # change colnames
#'     #colnames(pf) = c("factor1", "variable", "value")
#'     #pf$factor1 <- as.factor(pf$factor1) 
#'     
#'     # plotly requires this as a list
#'     #pf = as.list(pf)
#'     #print(pf)
#'     # plotly plot
#'     # pf$factor1 <-factor(pf$factor1, levels=pf[order(pf$value), "factor1"]))
#'     
#'     # c <- plot_ly(data=pf,
#'     #              x = factor1,
#'     #              y = value,
#'     #              color = variable,
#'     #              type ="bar", name="data")
#'     # c <- layout(c,
#'     #             xaxis = list(title=paste0("Selected Variable: ", i)),
#'     #             yaxis = list(title="Percentage of Exposure (%)"))
#'     # print(c)
#'     # 
#'     # add to global environment for debug
#'     p2 <<- p
#'     # add proper column names back to original data set
#'     colnames(olddat2) = c(i, "old_exp")
#'     colnames(newdat2) = c(i, "new_exp")
#'     # full join the original data set for separate cramers V calculation; e.g sudo contingency table
#'     tt_table = dplyr::full_join(olddat2, newdat2)
#'     # for calculations the NA should be transformed to very small actual values
#'     tt_table[is.na(tt_table)] <- 0.01
#'     # add row names of ith variable to retain information
#'     rownames(tt_table) = tt_table[[i]]
#'     # remove ith column since the rownames specify and is necessary for cramersV function
#'     tt_table[, i] = NULL
#'     v = cramersV(tt_table)
#'     # benchmark cutoff value to not show values equal to zero
#'     if (v != 0) {  
#'       v = round(as.numeric(v), digits = 5)  
#'     } # end of positive if statement
#'     
#'     # append to a list/data.frame
#'     Result[count] <- v
#'     count <- count + 1
#'     
#'   } # end of for loop
#'   
#'   # sort the list by highest cramer's v value: Ref: http://stackoverflow.com/questions/13156448/how-can-i-sort-a-data-frame-with-only-one-column-without-losing-rownames
#'   tbl_view = t (  data.frame(Result) )
#'   row.names(tbl_view) = varlst
#'   colnames(tbl_view) = c("CRAMERSV")
#'   tbl_view = tbl_view[order(tbl_view, decreasing = TRUE), , drop=FALSE]
#'   # add to global environment for debug
#'   tbl_v <<- tbl_view
#'   # print output
#'   print(tbl_view)
#'   # Stop the clock
#'   end = proc.time() - ptm
#'   v2 = round(as.numeric(unname(end['elapsed'])), digits = 2)
#'   print(paste0("The function performance was ", v2, " seconds."))
#'   
#' } # end of function
#' 
#' # function call
#' cv_all(df = data_bin_more_vars, state = 'FL', 
#'        pre_date1 = '2015-01-01', pre_date2 = '2015-08-21', 
#'        post_date1 = '2015-08-22', post_date2 = '2016-01-31', 
#'        varlst = c("ADVANCE QUOTE DAY COUNT GROUP"#, 
#'        ))
#' # "ACCOUNT CREDIT INDICATOR", 
#' # "CLEAN DIRTY", 
#' # "MINIMUM MAXIMUM AGE GROUP", 
#' # "MARKET INDEX CATEGORY CODE", 
#' # "MULTI SINGLE", 
#' # "HOME OWNERSHIP POLICY FORM CODE", 
#' # "HOMEOWNERSHIP CREDIT CODE", 
#' # "POLICY PACKAGE ENHANCEMENT CODE", 
#' # "AARP MEMBER STATUS DESCRIPTION", 
#' # "EXCESS VEHICLE INDICATOR", 
#' # "PRIOR CARRIER TYPE CODE", 
#' # "YOUTHFUL OPERATOR POLICY INDICATOR", 
#' # "ADVANCE QUOTE CR APP INDICATOR", 
#' # "ADVANCE QUOTE DAY COUNT GROUP", 
#' # "INSURANCE SCORE GROUP", 
#' # "MARKET SEGMENT CATEGORY NM GEN", 
#' # "POLICY ACCIDENT COUNT", 
#' # "POLICY AF ACCIDENT COUNT", 
#' # "POLICY COMP CLAIM COUNT", 
#' # "POLICY INCIDENT COUNT", 
#' # "POLICY MAJOR VIOLATION COUNT", 
#' # "POLICY MINOR OTHER VIOLATION COUNT", 
#' # "POLICY NAF ACCIDENT COUNT", 
#' # "POLICY NCAF ACCIDENT COUNT", 
#' # "POLICY TIER MNR VIOLATION COUNT", 
#' # "POLICY VIOLATION COUNT", 
#' # "RANDOM VARIABLE CHR"))
