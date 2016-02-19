# # # # # # # # # # # # # # # # # # 
#  Usage for panelDiv 
# # # # # # # # # # # # # # # # # #  
# panelDiv('info', 'Status', Sys.Date())


panelDiv <-function(class_type, panel_title, content) {
  HTML(paste0("<div class='panel panel-", class_type, 
      "'> <div class='panel-heading'><h3 class='panel-title'>", panel_title, 
      "</h3></div><div class='panel-body'>", content,  "</div></div>", sep=""))
}
  
  
  
