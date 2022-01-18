#' Load to namespace

.onLoad <- function(libname, pkgname) {
  sysfonts::font_add_google("Open Sans", "Open Sans") #add the font from the web
  showtext::showtext_auto() #tell R to use showtext to render text
}
