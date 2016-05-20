#' Create a file path
#'
#' @param mainDir a object of class 'character' which indicates your root that is already created
#' @param subDir a object of class 'character' which indicates your sub directory for models
#' @param version_num a object of class character which indicates your sub directory for model iterations
#' @param ... 
#'
#' @return a file folder is created if logic is satisfied
#' @export
create_file_path <- function(mainDir, subDir, version_num, ...) {
  # optimized into a function from http://stackoverflow.com/a/21223577
  subDir = paste0(subDir, version_num)
  
  if (file.exists(paste(mainDir, subDir, "/", sep = "/", collapse = "/"))) {
    cat("subDir exists in mainDir and is a directory...\n")
  } else if (file.exists(paste(mainDir, subDir, sep = "/", collapse = "/"))) {
    cat("subDir exists in mainDir but is a file...\n")
    # you will probably want to handle this separately
  } else {
    cat("subDir does not exist in mainDir - creating...\n")
    dir.create(file.path(mainDir, subDir))
  }
  
  if (file.exists(paste(mainDir, subDir, "/", sep = "/", collapse = "/"))) {
    # By this point, the directory either existed or has been successfully created
    setwd(file.path(mainDir, subDir))
  } else {
    cat("subDir does not exist...\n")
    # Handle this error as appropriate
  } 
  
}
