#' Customize a ggplot theme
#'
#' This function sets a custom theme in line with the TPL style guide for visualizations made with ggplot. This sets a legend to the right of the plot. It can be layered on to any ggplot visualization just like a built-in theme.
#'
#' If any trouble loading fonts, install and load the following package:
#' install.packages("extrafont")
#' library(extrafont)
#'
#' @return A layer to be added to a ggplot visualization that modifies non-data features
#' @export

#define theme_tpl_legend_right() function

theme_tpl_legend_right <- function(){

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
      legend.title = element_blank(),
      legend.text = element_text(size = 12, color = "gray30")

    )

}
