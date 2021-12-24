#' Load TPL brand colors
#'
#' Function that loads TPL's brand colors as a vector of hex codes. Can be used to set colors in plots and charts.
#'
#'
#' @return A vector of hex codes, which can be accessed by the name of the color if named=T
#' @param named Boolean that indicates whether vector should be named
#' @examples colors <- tpl_colors()
#' colors['darkblue'] #to access the named object
#' colors[['darkblue']] #to access the hex code directly
#' @export


tpl_colors <- function(named=TRUE){
  if(named==T){

    logo_hex <-
      c(darkblue = "#233D4D",
        teal = "#579C87",
        green = "#A1C181",
        yellow = "#FCCA46",
        orange = "#FE7F2D")

  }else{

    logo_hex <-
      c("#233D4D",
        "#579C87",
        "#A1C181",
        "#FCCA46",
        "#FE7F2D")

    }

  return(logo_hex)

}



#' ggplots with TPL brand colors
#'
#' Function that sets custom TPL brand fill in discrete-valued plots. It works just like the built-in ggplot layer scale_fill_discrete()
#'
#' @param ... Additional arguments passed to scale_fill_discrete()
#' @return A ggplot layer that fills discrete scales with brand colors
#' @examples
#' @export

scale_fill_discrete_tpl <- function(...){

  pal <- tpl_colors(named = F)

  ggplot2::scale_fill_discrete(..., type = pal)

}


#' ggplots with TPL brand colors
#'
#' Function that sets custom TPL brand color in discrete-valued plots. It works just like the built-in ggplot layer scale_color_discrete()
#'
#' @param ... Additional arguments passed to scale_color_discrete()
#' @return A ggplot layer that colors discrete scales with brand colors
#' @examples
#' @export

scale_color_discrete_tpl <- function(...){

  pal <- tpl_colors(named = F)

  ggplot2::scale_color_discrete(..., type = pal)

}


#' ggplots with TPL brand colors
#'
#' Function that sets custom TPL brand color in continuously-valued plots. Other than customized parameters, it works just like the built-in ggplot layer scale_fill_continuous()
#'
#' @param color String that specifies which TPL brand color to use for gradient color scheme. Must be one of 'darkblue', 'teal', 'green', 'yellow', 'orange'
#' @param reverse Boolean that assigns the highest values to the lightest hue when set to TRUE (default=FALSE)
#' @param ... Additional arguments passed to scale_fill_continuous()
#' @return A ggplot layer that fills continuous scales with brand colors
#' @examples
#' @export

scale_fill_continuous_tpl <- function(color, reverse=F, ...){

  colors <- tpl_colors() #create brand color vector

  base <- colors[[color]] #select specified color to use as base for creating color palette

  palette <- colorRampPalette(c(base, "#ffffff") , space = "rgb") #creates a custom function for hues from darkest to white

  pal <- unlist(palette(11)[1:10]) #custom palette, subset to remove white color from the vector

  if(reverse){

    ggplot2::scale_fill_gradient(..., low = base, high = pal[10])

  }else{

    ggplot2::scale_fill_gradient(..., low = pal[10], high = base)

  }

}


#' ggplots with TPL brand colors
#'
#' Function that sets custom TPL brand color in continuously-valued plots. Other than customized parameters, it works just like the built-in ggplot layer scale_color_continuous()
#'
#' @param color String that specifies which TPL brand color to use for gradient color scheme. Must be one of 'darkblue', 'teal', 'green', 'yellow', 'orange'
#' @param reverse Boolean that assigns the highest values to the lightest hue when set to TRUE (default=FALSE)
#' @param ... Additional arguments passed to scale_color_continuous()
#' @return A ggplot layer that colors continuous scales with brand colors
#' @examples
#' @export

scale_color_continuous_tpl <- function(color, reverse=F, ...){

  colors <- tpl_colors() #create brand color vector

  base <- colors[[color]] #select specified color to use as base for creating color palette

  palette <- colorRampPalette(c(base, "#ffffff") , space = "rgb") #creates a custom function for hues from darkest to white

  pal <- unlist(palette(11)[1:10]) #custom palette, subset to remove white color from the vector

  if(reverse){

    ggplot2::scale_color_gradient(..., low = base, high = pal[10])

  }else{

    ggplot2::scale_color_gradient(..., low = pal[10], high = base)

  }

}
