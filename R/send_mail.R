#' Send a email upon R code completion
#'
#' @param subject a object of class 'character'
#' @param text a object of class 'character'
#' @param address a object of class 'character'
#' @param file a object of class 'logical'
#' @param filename ... default name
#' @param linux a object of class 'logical'
#'
#' @return a email is sent to you
#' @export
#'
send_email <- function(subject, text, address, file = FALSE, filename = "MyRFile", linux = TRUE){
  if (linux) { # for linux and MacOS only

    if(file == FALSE){
      sys.arg <- paste("echo '", text, "' | mail -s ", subject,  " ", address, sep = "")
    }else{
      sys.arg <- paste("mail -s ", subject, " ", address, " < ", text, sep = "")
    }
    system(sys.arg)
  }
}
