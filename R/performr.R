# a function to test file read performance for csv files and more

performr <- function(filename, method = "all", ...){
  if (method=="readr"){
    library(readr)
    # Start the clock!
    start = ptm <- proc.time() 
    in_file = read_csv(filename, na = "NA")
    # Stop the clock
    end = proc.time() - ptm
    paste0("The method readr performance was ", start-end, ".")
    
  } else if (method == "utils") {
    start = ptm <- proc.time() 
    in_file = read.table(filename, header = T, sep=",", na.strings = "NA", stringsAsFactors = FALSE)
    end = proc.time() - ptm
    paste0("The method utils performance was ", start-end, ".")
    
  } else if (method == "data.table") {
    library(data.table)
    start = ptm <- proc.time() 
    in_file = fread(filename)
    end = proc.time() - ptm
    paste0("The method data.table performance was ", start-end, ".")
  } 
  
  if (method == "all") {
    library(readr)
    start1 = ptm <- proc.time() 
    in_file1 = read_csv(filename, na = "NA")
    end1 = proc.time() - ptm
    total1 = start1 - end1
    #########################
    start2 = ptm <- proc.time() 
    in_file = read.table(filename, header = T, sep=",", na.strings = "NA", stringsAsFactors = FALSE)
    end2 = proc.time() - ptm
    total2 = start2 - end2
    ########################
    library(data.table)
    start3 = ptm <- proc.time() 
    in_file3 = fread(filename)
    end3 = proc.time() - ptm
    total3 = start3 - end3
    # method comparison
    if(total1["user.self"] < total2["user.self"] & total1["user.self"] < total3["user.self"]) {
      paste0("The fastest method is readr")
    } else if (total2["user.self"] < total1["user.self"] & total2["user.self"] < total3["user.self"]) {
      paste0("The fastest method is utils")
    }
    else {
      paste0("The fastest method is data.table")
    }
  }
}