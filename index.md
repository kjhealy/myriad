# myriad

This package is not really meant for general use.

## About

Myriad Pro-based theme for ggplot, providing
[`theme_myriad_semi()`](https://kjhealy.github.io/myriad/reference/theme_myriad_semi.md),
[`theme_myriad_map()`](https://kjhealy.github.io/myriad/reference/theme_myriad_map.md)
and
[`theme_myriad_nymap()`](https://kjhealy.github.io/myriad/reference/theme_myriad_nymap.md),
along with `_socviz_` versions of all of these, which are identical but
premised on the existence of top-level fonts named Socviz that pull out
the SemiCondensed and Condensed versions of Myriad, as [detailed
here](https://kieranhealy.org/blog/archives/2025/02/06/kerning-and-kerning-in-a-widening-gyre/).
All based on Myriad Pro SemiCondensed face, with Myriad Pro Condensed
also available for labels inside the plot area.

Note that this repo does not include the Myriad font files (the `.otf`
files), which are owned by Adobe. You may already have them installed on
your computer, or they may have come bundled with your copy of Acrobat
Reader or other Adobe software.

## Usage

When creating PDFs, use with `showtext`. (To get embedded fonts with
proper kerning in a PDF you will need to use Cairo and sacrifice several
goats. Again, [see here for the soul-crushing
details](https://kieranhealy.org/blog/archives/2025/02/06/kerning-and-kerning-in-a-widening-gyre/).)

``` r
library(tidyverse)
library(ggrepel)
```

``` r
library(showtext)
showtext_opts(dpi = 300)
showtext_auto()

library(myriad)

# Semi variant
import_socviz_semi()

# Condensed for in-graph text
import_socviz_condensed()

# ggplot theme
theme_set(theme_socviz_semi())
```

# Basic Test

``` r
p <- ggplot(mtcars, 
            aes(x = wt, y = mpg)) + 
  geom_point() + 
  labs(x = "Weight", y = "Miles per Gallon", 
       title = "This is the title", subtitle = "This is the subtitle", 
       caption = "This is the caption")  

p
```

![](reference/figures/README-unnamed-chunk-3-1.png)

# Check PDF works

``` r
ggsave("man/figures/ggfont-test-myrnew-2.pdf", p, width = 6, height = 4)
```

# With labels (using Myriad Pro Condensed)

``` r
out <- mtcars |>
  mutate(car = rownames(mtcars)) |> 
  as_tibble() |> 
  ggplot(aes(x = wt, y = mpg, label = car)) + 
  geom_point() + 
  geom_text_repel(family = "Socviz Condensed") +
  facet_wrap(~ cyl, ncol = 1) + 
  labs(title = "Title", 
       subtitle = "Subtitle")

out
#> Warning: ggrepel: 2 unlabeled data points (too many overlaps). Consider
#> increasing max.overlaps
```

![](reference/figures/README-unnamed-chunk-5-1.png)

## Check PDF works

``` r
ggsave("man/figures/ggfont-test-myrnew-3.pdf", out, width = 12, height = 8)
```
