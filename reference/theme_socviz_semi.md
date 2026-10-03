# theme_socviz_semi

A \[ggplot2\] theme using the Socviz variants of Adobe Myriad Pro

## Usage

``` r
theme_socviz_semi(
  base_size = 12,
  base_family = "Socviz Condensed",
  header_family = "Socviz SemiCondensed",
  base_line_size = base_size/24,
  base_rect_size = base_size/24,
  ink = "black",
  paper = "white",
  accent = "#0072B2"
)

theme_socviz_kjh(
  base_size = 12,
  base_family = "Socviz Condensed",
  header_family = "Socviz SemiCondensed",
  base_line_size = base_size/24,
  base_rect_size = base_size/24,
  ink = "black",
  paper = "white",
  accent = "#0072B2"
)
```

## Arguments

- base_family, header_family, base_size, base_line_size, base_rect_size:

  base font family, title font family, and sizes

- ink, paper, accent:

  foreground, background, and accent colours

## Details

You should \[import_socviz_condensed\]() and \[import_socviz_semi\]()
first and also install the fonts on your system before trying to use
this theme. Requires ggplot2 4.0.0 or later. The theme carries its own
discrete colour and fill palette.

## Author

Kieran Healy

## Examples

``` r
if (FALSE) { # \dontrun{
} # }
```
