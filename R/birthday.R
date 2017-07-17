#' A simple function for Birthday awareness
#'
#' @return a printed message indicating if it is my birthday
#' @export
#'
#' @examples  birthday()
birthday = function() {
if ('12-25$' %in% Sys.Date()) {
print('it is my birthday today')
} else {
  print('it is not my birthday')
}
  }
