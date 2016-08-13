#' add a code block to your code!
#'
#' @param text a string
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
code_block = function(text) {
l = nchar(text)
cat(replicate(l, "#"), "\n", "# ", text, "\n", replicate(l, "#"))
}
