#' Customize a ggplot theme
#'
#' This function sets a custom theme in line with the TPL style guide for visualizations made with ggplot. This sets a legend horizontally across the top of the plot. It can be layered on to any ggplot visualization just like a built-in theme.
#'
#' @return A layer to be added to a ggplot visualization that modifies non-data features
#' @export

#define theme_tpl_legend_top() function

theme_tpl_legend_top <- function(){

  sysfonts::font_add_google("Open Sans", "Open Sans") #add the font from the web
  showtext::showtext_auto() #tell R to use showtext to render text

  ggplot2::theme_classic() %+replace% #modifying the built-in ggplot theme

    ggplot2::theme(

      #text elements
      text = ggplot2::element_text(family = "Open Sans", face = "plain"),
      plot.title = ggplot2::element_text(size = 18, color = "gray30", hjust = 0, vjust = 0),
      plot.subtitle = ggplot2::element_text(size = 14, color = "gray30", hjust = 0, vjust = 0),
      axis.text = ggplot2::element_text(size = 16, color = "gray30"),
      axis.title = ggplot2::element_text(size = 16, color = "gray30"),
      strip.text = ggplot2::element_text(size = 14, color = "gray30"),

      #ticks and grid elements
      axis.ticks = ggplot2::element_blank(),
      panel.grid.major.y = ggplot2::element_blank(),
      axis.line.y.left = ggplot2::element_blank(),
      axis.line.x.bottom = ggplot2::element_line(color = "gray"),

      #caption elements
      plot.caption = ggplot2::element_text(hjust = 0, size = 12, color = "gray30"),

      #legend elements
      legend.position = "top",
      legend.justification = "left",
      legend.title = ggplot2::element_blank(),
      legend.direction = "horizontal",
      legend.text = ggplot2::element_text(size = 12, color = "gray30")

    )

}
