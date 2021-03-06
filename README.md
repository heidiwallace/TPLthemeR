---
title: "Introduction to TPLthemeR"
author: "Heidi Wallace"
date: "January 19, 2022, 12:04"
output: 
  html_document:
    keep_md: true
    toc: true
    toc_depth: 3

---


```r
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 8, 
  fig.height = 6, 
  message = FALSE,
  warning = FALSE
)
```


### Installation & Setup

This is a brief guide to using the `TPLthemeR` package, which provides themes and colors for customizing `ggplot2` visualizations using TPL's style guide. 


##### Install the package

The custom package can be installed to your R library directly from GitHub using the following commands in RStudio:


```r
install.packages("devtools") #devtools allows installation directly from github; only run this command if you do not already have devtools installed

devtools::install_github("heidiwallace/TPLthemeR") #install the package to your R library
```

<br>

**Note**: If you run into trouble installing the `devtools` package, you may need to download Xcode (on Mac) or Rtools (on Windows) first, then re-run these commands. See <a href="https://www.r-project.org/nosvn/pandoc/devtools.html">here</a> for more details or let me know if I can help troubleshoot! 


<br><br>

### Plotting with the custom theme

The package currently provides three custom themes that can be added to ggplot visualizations in the same way that `ggplot2`'s built-in themes are layered onto plots. The custom theme functions are `theme_tpl()`, `theme_tpl_legend_top()`, and `theme_tpl_legend_right()`.

`theme_tpl()` customizes the plot grid and fonts. This function can be used in conjunction with the typical `theme()` syntax for additional customization. The themes called `theme_tpl_legend_top()` and `theme_tpl_legend_right()` differ only in offering customized settings for legends. Themes with legends are demonstrated in a later section.


```r
#load the packages
library(TPLthemeR)
library(ggplot2)
library(tidyverse)
```


```r
#plot with default ggplot2 theme
p <- 
  diamonds %>% 
  ggplot(aes(cut, price)) +
  geom_col() +
  labs(title = "Prices of diamonds by cut",
       caption = "Here is a sample caption")

p
```

![](README_files/figure-html/unnamed-chunk-4-1.png)<!-- -->


```r
#plot with custom TPL theme
p + theme_tpl()
```

![](README_files/figure-html/unnamed-chunk-5-1.png)<!-- -->

<br>

Note that attaching the `TPLthemeR` package using the `library` command is required for the fonts to display properly. Using the `TPLthemeR::theme_tpl()` method of calling functions without attaching the package using `library(TPLthemeR)` may behave unpredictably with fonts.

<br>

Note also that the `theme_tpl()` function can be used in conjunction with `ggplot2`'s built-in <a href="https://ggplot2.tidyverse.org/reference/ggtheme.html">`theme()`</a> layers to override settings. To do this, be sure that the `theme()` layer follows the `theme_tpl()` layer.

<br>


```r
#plot with custom TPL theme & adjustments
p + 
  theme_tpl() +
  theme(axis.title.x = element_blank(),
        axis.text.y = element_text(size = 11),
        plot.caption = element_text(face = "italic"))
```

![](README_files/figure-html/unnamed-chunk-6-1.png)<!-- -->

<br>

Font sizes have been optimized for exporting to .png files and displaying in slide shows. They should display reasonably well in Rmd outputs too, but you may need to adjust the figure height and width settings using the `knitr::opts_chunk$set()` function (see the code at the start of this guide for an example). 

Pro tip: If you want to override some settings in the `theme_tpl` function and easily apply that to multiple plots, save your settings into a variable that can be layered on to any `ggplot2` visualization, as follows.


```r
#save ggplot layers to a variable
new_theme <- 
  theme_tpl() +
  theme(axis.title.x = element_blank(),
        axis.text.y = element_text(size = 11),
        plot.caption = element_text(face = "italic"))

#plot using variable as layer
p +
  new_theme
```

![](README_files/figure-html/unnamed-chunk-7-1.png)<!-- -->

<br><br>


### Setting colors using plot layers

The package also provides four built-in functions called `scale_fill_discrete_tpl()`, `scale_fill_continuous_tpl()`, `scale_color_discrete_tpl()`, and `scale_color_continuous_tpl()`. These can be layered on to plots to provide branded coloring. These functions work just like the built-in `ggplot` functions `scale_fill_discrete()`,  `scale_fill_continuous()`, `scale_color_discrete()`, and `scale_color_continuous()`, and they accept the same arguments as the built-in functions. 

See `?scale_fill_continuous_tpl` and `?scale_color_continuous_tpl` for the two additional arguments that these functions require.



```r
#example with discrete colors

diamonds %>% 
  ggplot(aes(cut, price, fill = cut)) +
  geom_col() +
  labs(title = "Prices of diamonds by cut",
       caption = "Here is a sample caption") + 
  scale_fill_discrete_tpl() +
  theme_tpl() +
  theme(legend.position = "none",
        axis.title.x = element_blank())
```

![](README_files/figure-html/unnamed-chunk-8-1.png)<!-- -->

<br>

It's important to note that there only five colors in the custom palette, so if you have more than five discrete categories, ggplot will revert to its default colors to accommodate the additional categories. 

<br>



```r
#example with continuous colors

g <- 
  ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
  geom_tile()

g + 
  theme_tpl_legend_right() +
  scale_fill_continuous_tpl('teal', reverse = T)
```

![](README_files/figure-html/unnamed-chunk-9-1.png)<!-- -->


<br><br>

### Adding legends

`theme_tpl_legend_top()` and `theme_tpl_legend_right()` are layers to that apply the custom TPL theme to legends. Use `theme_tpl_legend_top()` to set the legend underneath the title and `theme_tpl_legend_right()` to set the legend to the right of the plot.


```r
#a plot with right legend
diamonds %>% 
  group_by(color, cut) %>% 
  summarise(price = mean(price)) %>% 
  ggplot(aes(color, price, fill = cut)) +
  geom_col(position = "dodge") +
  labs(title = "Prices of diamonds by color and cut",
       caption = "Here is a sample caption") +
  theme_tpl_legend_right() +
  scale_fill_discrete_tpl()
```

![](README_files/figure-html/unnamed-chunk-10-1.png)<!-- -->

<br>


```r
#a plot with top legend
diamonds %>% 
  group_by(color, cut) %>% 
  summarise(price = mean(price)) %>% 
  ggplot(aes(color, price, fill = cut)) +
  geom_col(position = "dodge") +
  labs(title = "Prices of diamonds by color and cut",
       caption = "Here is a sample caption") +
  theme_tpl_legend_top() +
  scale_fill_discrete_tpl()
```

![](README_files/figure-html/unnamed-chunk-11-1.png)<!-- -->


<br><br>

### Setting colors manually

TPL colors can also be called using the function `tpl_colors()`. This function creates a vector of named color hex codes. The colors and their codes are shown below.

![](README_files/figure-html/unnamed-chunk-12-1.png)<!-- -->

<br>

A single color's hex code can be called using the name.


```r
#create a vector of color hex codes
colors <- tpl_colors()

colors[['darkblue']]
#> [1] "#233D4D"
```


<br>

A use case for this function is setting a single color or set of colors in a plot.


```r
#plot using a hex code from the vector
diamonds %>% 
  ggplot(aes(cut, price)) +
  geom_col(fill = colors[['orange']]) +
  labs(title = "Prices of diamonds by cut",
       caption = "Here is a sample caption") +
  theme_tpl()
```

![](README_files/figure-html/unnamed-chunk-14-1.png)<!-- -->


<br><br>

### Resources

* <a href="http://rpubs.com/mclaire19/ggplot2-custom-themes">Learning to create custom themes in ggplot</a>

* <a href="https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2">Creating corporate colour palettes for ggplot2</a>

* <a href="https://tinyheero.github.io/jekyll/update/2015/07/26/making-your-first-R-package.html">Making your first R package</a>

* <a href="https://github.com/yixuan/showtext/">Showtext package</a>
