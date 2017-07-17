#' add a code block to your code!
#'
#' @param text a character string
#'
#' @return formated string in the console to be copied to your source
#' @export
#'
#' @examples code_block("This section is important")
#'
#' ## output is below to be copied:
#' # # # # # # # # # # # # # # # # # # # # # # # # #
#'   #  This section is important
#' # # # # # # # # # # # # # # # # # # # # # # # # #
code_block = function(text){
  l = nchar(text)
  l = ifelse(l > 22, 20, l)

  cat(replicate(l, "#"), "\n", "# ",
      text, "\n", replicate(l, "#"))
}
