
# TPLthemeR

```{r, include = FALSE}
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 8, 
  fig.height = 6, 
  message = FALSE,
  warning = FALSE
)
```

```{r setup}
library(TPLthemeR)
library(ggplot2)
library(tidyverse)
```

### Installation

This is a brief guide to using the `TPLthemeR` package, which provides themes and colors for customizing ggplot visualizations using TPL's style guide. 

The package can be installed to your R library directly from GitHub using RStudio with the following commands:

```{r, eval=FALSE}
install.packages("devtools") #only if you do not already have devtools installed
devtools::install_github("heidiwallace/TPLthemeR")
```

<br><br>

### Plot layers

The package currently provides three custom themes that can be added to ggplot visualizations in the same way that `ggplot2`'s built-in themes are layered onto plots. The custom themes are `theme_tpl()`, `theme_tpl_legend_top()`, and `theme_tpl_legend_right()`.

`theme_tpl()` customizes the plot grid and fonts. It does not provide any customization for legends, though additional customization can be layered on manually. The additional themes provide customized settings for legends placed either at the top of the plot (underneath the title) or to the right of the chart.

```{r}
#plot with default ggplot2 theme
p <- 
  diamonds %>% 
  ggplot(aes(cut, price)) +
  geom_col() +
  labs(title = "Prices of diamonds by cut",
       caption = "Here is a sample caption")

p
```

```{r}
#plot with custom TPL theme
p + theme_tpl()
```


<br><br>

### Setting colors using plot layers

The package also provides two built-in functions called `scale_fill_discrete_tpl()` and `scale_fill_continuous_tpl()`. These can be layered on to provide branded coloring. These functions work just like the built-in `ggplot` functions `scale_fill_discrete()` and `scale_fill_continuous()` and they accept the same arguments. 

See `?scale_fill_continuous_tpl` for the two additional arguments that this function requires.

Note also that the `theme_tpl()` function can be used in conjunction with typical `theme()` layers. If you wish to override any settings in `theme_tpl()`, `theme()` must follow the `theme_tpl()` layer.

Example with discrete colors:

```{r}
diamonds %>% 
  ggplot(aes(cut, price, fill = cut)) +
  geom_col() +
  labs(title = "Prices of diamonds by cut",
       caption = "Here is a sample caption") + 
  scale_fill_discrete_tpl() +
  theme_tpl() +
  theme(legend.position = "none")
```

<br><br>

Example with continuous colors:

```{r}
g <- 
  ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
  geom_tile()

g + 
  theme_tpl_legend_right() +
  scale_fill_continuous_tpl('teal', reverse = T)

```

<br><br>

### Setting colors manually

TPL colors can also be called using the function `tpl_colors()`. This function creates a vector of named color hex codes. The colors and their codes are shown below.

```{r,echo=FALSE}
cols <- tpl_colors()
n_seq <- seq_along(cols)
image(n_seq, 1, as.matrix(n_seq), col = cols,
      xlab = "", ylab = "", xaxt = "n", yaxt = "n", bty = "n",
      main = "The People Lab Colors")
text(n_seq, 1, paste(names(cols), cols, sep = "\n"), col = "white", srt = 0)
```

<br><br>

A use case for this function is setting a single color or set of colors in a plot.

```{r}
colors <- tpl_colors()

diamonds %>% 
  ggplot(aes(cut, price)) +
  geom_col(fill = colors[['orange']]) +
  labs(title = "Prices of diamonds by cut",
       caption = "Here is a sample caption") +
  theme_tpl()
```


### References

* <a href="http://rpubs.com/mclaire19/ggplot2-custom-themes">Learning to create custom themes in ggplot</a>

* <a href="https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2">Creating corporate colour palettes for ggplot2</a>

* <a href="https://tinyheero.github.io/jekyll/update/2015/07/26/making-your-first-R-package.html">Making your first R package</a>
