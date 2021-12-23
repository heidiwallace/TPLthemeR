#' Customize a ggplot theme
#'
#' This function sets a custom theme for visualizations made with ggplot in line with the TPL style guide
#' If any trouble loading fonts, install and load the following package:
#' install.packages("extrafont")
#' library(extrafont)
#'
#' @return 
#' @export

#define theme_tpl() function

theme_tpl <- function(){
  
  ggplot2::theme_classic() %+replace% #modifying the built-in ggplot theme
    
    ggplot2::theme(
      
      #text elements
      text = element_text(family = "Verdana", face = "plain"),
      plot.title = element_text(size = 18, color = "gray30", hjust = 0, vjust = 0),
      plot.subtitle = element_text(size = 14, color = "gray30", hjust = 0, vjust = 0),
      axis.text = element_text(size = 16, color = "gray30"),
      axis.title = element_text(size = 16, color = "gray30"),
      strip.text = element_text(size = 14, color = "gray30"),
      
      #ticks and grid elements
      axis.ticks = element_blank(),
      panel.grid.major.y = element_blank(),
      axis.line.y.left = element_blank(),
      axis.line.x.bottom = element_line(color = "gray"),
      
      #caption elements
      plot.caption = element_text(hjust = 0, size = 12, color = "gray30"),
      
      #legend elements
      legend.position = "top",
      legend.justification = "left",
      legend.title = element_blank(),
      legend.direction = "horizontal",
      legend.text = element_text(size = 12, color = "gray30")
      
    )  
  
}
