% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/myriad.r
\name{theme_myriad_semi}
\alias{theme_myriad_semi}
\title{theme_myriad_semi}
\usage{
theme_myriad_semi(base_family = "Myriad Pro SemiCondensed",
  base_size = 11, plot_title_family = base_family,
  plot_title_size = 14, plot_title_face = "bold",
  plot_title_margin = 10, subtitle_family = "Myriad Pro SemiCondensed",
  subtitle_size = 12, subtitle_face = "plain", subtitle_margin = 15,
  strip_text_family = base_family, strip_text_size = 12,
  strip_text_face = "plain",
  caption_family = "Myriad Pro SemiCondensed", caption_size = 6,
  caption_face = "plain", caption_margin = 14,
  axis_title_family = base_family, axis_title_size = 12,
  axis_title_face = "plain", axis_title_just = "cc",
  plot_margin = grid::unit(c(5.5, 12, 5.5, 5.5), "pt"),
  panel_spacing = grid::unit(0.5, "lines"), grid = TRUE,
  axis = FALSE, ticks = FALSE)
}
\arguments{
\item{base_family, base_size}{base font family and size}

\item{plot_title_family, plot_title_face, plot_title_size, plot_title_margin}{plot tilte family, face, size and margi}

\item{subtitle_family, subtitle_face, subtitle_size}{plot subtitle family, face and size}

\item{subtitle_margin}{plot subtitle margin bottom (single numeric value)}

\item{strip_text_family, strip_text_face, strip_text_size}{facet label font family, face and size}

\item{caption_family, caption_face, caption_size, caption_margin}{plot caption family, face, size and margin}

\item{axis_title_family, axis_title_face, axis_title_size}{axis title font family, face and size}

\item{axis_title_just}{axis title font justificationk one of `[blmcrt]`}

\item{plot_margin}{plot margin (specify with [ggplot2::margin])}

\item{grid}{panel grid (`TRUE`, `FALSE`, or a combination of `X`, `x`, `Y`, `y`)}

\item{axis}{add x or y axes? `TRUE`, `FALSE`, "`xy`"}

\item{ticks}{ticks if `TRUE` add ticks}
}
\description{
A [ggplot2] theme using semibold variants of Adobe Myriad Pro, adapted from [hrbrthemes]'s roboto condensed.
}
\details{
You should [import_myriad_semi]() first and also install the fonts on your
system before trying to use this theme.
}
\examples{
\dontrun{
library(ggplot2)
library(dplyr)

# seminal scatterplot
ggplot(mtcars, aes(mpg, wt)) +
  geom_point() +
  labs(x="Fuel effiiency (mpg)", y="Weight (tons)",
       title="Seminal ggplot2 scatterplot example",
       subtitle="A plot that is only useful for demonstration purposes",
       caption="Brought to you by the letter 'g'") +
  theme_myriad_semi()

# seminal bar chart

count(mpg, class) \%>\%
  ggplot(aes(class, n)) +
  geom_col() +
  geom_text(aes(label=n), nudge_y=3) +
  labs(x="Fuel effiiency (mpg)", y="Weight (tons)",
       title="Seminal ggplot2 bar chart example",
       subtitle="A plot that is only useful for demonstration purposes",
       caption="Brought to you by the letter 'g'") +
  theme_myriad_semi(grid="Y") +
  ggplot2::theme(axis.text.y=ggplot2::element_blank())
}
}
\author{
Kieran Healy
}