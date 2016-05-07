#' Test and compare csv reading performance with multiple packages
#'
#' @param filename object of class character indicating filepath of dataset
#' @param method object of class character/string choose "all" to run all the methods or select from single methods 'readr','utils', 'data.table', 'bigmemory', 'ff', 'sqldf'.
#' @param ... optional
#'
#' @return a string message stating which method was the fastest
#' @export
#'
#' @examples performr("~iris.csv", "readr")
performr <- function(filename, method = "all", ...){
  if (method=="readr"){
    library(readr)
    # Start the clock!
    start = ptm <- proc.time()
    in_file = read_csv(filename, na = "NA")
    # Stop the clock
    end = proc.time() - ptm
    paste0("The method readr performance was ", start["elapsed"]-end["elapsed"], ".")

  } else if (method == "utils") {
    start = ptm <- proc.time()
    in_file = read.table(filename, header = T, sep=",", na.strings = "NA", stringsAsFactors = FALSE)
    end = proc.time() - ptm
    paste0("The method utils performance was ", start["elapsed"]-end["elapsed"], ".")

  } else if (method == "data.table") {
    library(data.table)
    start = ptm <- proc.time()
    in_file = fread(filename)
    end = proc.time() - ptm
    paste0("The method data.table performance was ", start["elapsed"]-end["elapsed"], ".")

  } else if (method == "bigmemory") {
    library(bigmemory)
    library(bigmemory.sri)
    start = ptm <- proc.time()
    in_file = read.big.matrix(filename, row.names=TRUE, sep = ",")
    end = proc.time() - ptm
    paste0("The method bigmemory performance was ", start["elapsed"]-end["elapsed"], ".")

  } else if (method == "ff") {
    library(ff)
    start = ptm <- proc.time()
    in_file = read.csv.ffdf(file = filename)
    end = proc.time() - ptm
    paste0("The method ff performance was ", start["elapsed"]-end["elapsed"], ".")

  } else if (method == "sqldf") {
    library(sqldf)
    start = ptm <- proc.time()
    in_file = read.csv.sql(file = filename)
    end = proc.time() - ptm
    paste0("The method sqldf performance was ", start["elapsed"]-end["elapsed"], ".")

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
    if(total1["elapsed"] < total2["elapsed"] & total1["elapsed"] < total3["elapsed"]) {
      paste0("The fastest method is readr")
    } else if (total2["elapsed"] < total1["elapsed"] & total2["elapsed"] < total3["elapsed"]) {
      paste0("The fastest method is utils")
    }
    else {
      paste0("The fastest method is data.table")
    }
  }
}
