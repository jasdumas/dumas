#' Add a panel div block for Shiny
#'
#' @param class_type object of class character, options for color 'info', 'primary', 'success', 'danger', 'warning'
#' @param panel_title object of class character, text for panel header.
#' @param content object of class character, functions for date or time
#'
#' @return HTML formated for a panel div
#' @export
#'
#' @examples panelDiv('info', 'Status', Sys.Date())
#' @details http://getbootstrap.com/components/#panels
panelDiv <-function(class_type, panel_title, content) {
  HTML(paste0("<div class='panel panel-", class_type,
      "'> <div class='panel-heading'><h3 class='panel-title'>", panel_title,
      "</h3></div><div class='panel-body'>", content,  "</div></div>", sep=""))
}



