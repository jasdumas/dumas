#' GGPLOT2 personal theme
#' @description this was definetly inspiried by 538
#' @param title a string indicating title of plot
#' @param subtitle a string indicating the subtitle of plot (development version of ggplot2)
#' @param ... additional params
#'
#' @return a ggplot2 plot with format
#' @export
#'
#' @examples
#' ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length, color = Species)) +
#'   geom_jitter() +
#'   theme_minimal() +
#'   theme_jasmine(title = "Hi", subtitle = "yo")
theme_jasmine <- function(title, subtitle, ...){
  library(ggplot2)
  theme_jasmine <- list(titles(title=title, subtitle=subtitle), th(), bold_line())
}

titles <- function(title, subtitle, ...){
  library(ggplot2)
    # set up subtitle
    subtitle <- paste0(strwrap(subtitle, 80), sep="", collapse="\n")
    # Set main plot title and subtitle
    labs(title = title, subtitle = subtitle)
}

th <- function(){
  library(ggplot2)
  theme(plot.title=element_text(face="bold"),
        plot.subtitle=element_text(margin=margin(b=15)),
        # Set title and axis labels, and format these and tick marks
        plot.caption=element_text(margin=margin(t=15), face="italic", size=8),
        axis.text.x=element_text(size=11,color="#535353",face="bold"),
        axis.text.y=element_text(size=11,color="#535353",face="bold"),
        axis.title.y=element_text(size=11,color="#535353",face="bold",vjust=1.5),
        axis.title.x=element_text(size=11,color="#535353",face="bold",vjust=-.5))

}

bold_line <- function(){
  library(ggplot2)
  # Big bold line at y=0
  geom_hline(yintercept=0,size=1.2,colour="#535353")
}



