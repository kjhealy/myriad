#' A [ggplot2] theme using semibold variants of Adobe Myriad Pro
#'
#' You should [import_myriad_semi]() first and also install the fonts on your
#' system before trying to use this theme.
#'
#' @title theme_myriad_semi
#' @param base_family,title_family,base_size,base_line_size,base_rect_size base font family and size
#' @export
#' @examples \dontrun{
#' }
#' @author Kieran Healy
theme_myriad_semi <-
  function (base_size = 12,
            base_family = "Myriad Pro SemiCondensed",
            title_family = "Myriad Pro SemiCondensed",
            base_line_size = base_size / 24,
            base_rect_size = base_size / 24)
  {
    half_line <- base_size / 2
    t <-
      theme(
        line = element_line(
          colour = "black",
          linewidth = base_line_size,
          linetype = 1,
          lineend = "butt"
        ),
        rect = element_rect(
          fill = "white",
          colour = "black",
          linewidth = base_rect_size,
          linetype = 1
        ),
        text = element_text(
          family = base_family,
          face = "plain",
          colour = "black",
          size = base_size,
          lineheight = 0.9,
          hjust = 0.5,
          vjust = 0.5,
          angle = 0,
          margin = margin(),
          debug = FALSE
        ),
        axis.line = element_line(color = "gray90", linewidth = 0.15),
        axis.text = element_text(color = "black"),
        axis.text.x = element_text(margin = margin(t = 0.8 *
                                                     half_line /
                                                     2), vjust = 1),
        axis.text.x.top = element_text(margin = margin(b = 0.8 *
                                                         half_line /
                                                         2), vjust = 0),
        axis.text.y = element_text(margin = margin(r = 0.8 *
                                                     half_line /
                                                     2), hjust = 1),
        axis.text.y.right = element_text(margin = margin(l = 0.8 *
                                                           half_line /
                                                           2), hjust = 0),
        axis.ticks = element_line(colour = "grey20"),
        axis.ticks.length = unit(half_line / 2, "pt"),
        axis.ticks.length.x = NULL,
        axis.ticks.length.x.top = NULL,
        axis.ticks.length.x.bottom = NULL,
        axis.ticks.length.y = NULL,
        axis.ticks.length.y.left = NULL,
        axis.ticks.length.y.right = NULL,
        axis.title = element_text(size = rel(1.1)),
        axis.title.x = element_text(margin = margin(t = half_line / 2),
                                    vjust = 1),
        axis.title.x.top = element_text(margin = margin(b = half_line / 2),
                                        vjust = 0),
        axis.title.y = element_text(
          angle = 90,
          margin = margin(r = half_line /
                            2),
          vjust = 1
        ),
        axis.title.y.right = element_text(
          angle = -90,
          margin = margin(l = half_line /
                            2),
          vjust = 0
        ),
        legend.background = element_blank(),
        legend.spacing = unit(2 * half_line, "pt"),
        legend.spacing.x = NULL,
        legend.spacing.y = NULL,
        legend.margin = margin(half_line,
                               half_line, half_line, half_line),
        legend.key = element_rect(fill = "white",
                                  colour = NA),
        legend.key.size = unit(1.2, "lines"),
        legend.key.height = NULL,
        legend.key.width = NULL,
        legend.text = element_text(size = rel(0.8)),
        legend.text.align = NULL,
        legend.title = element_text(hjust = 0),
        legend.title.align = NULL,
        legend.position = "top",
        legend.direction = "horizontal",
        legend.box = "horizontal",
        legend.justification = "center",
        legend.box.margin = margin(0, 0, 0,
                                   0, "cm"),
        legend.box.background = element_blank(),
        legend.box.spacing = unit(2 * half_line, "pt"),
        panel.background = element_rect(fill = "white",
                                        colour = NA),
        panel.border = element_blank(),
        panel.grid = element_line(colour = "gray90", linewidth = 0.1),
        panel.grid.major = element_line(colour = "gray90", linewidth = 0.1),
        panel.grid.minor = element_line(colour = "gray90", linewidth = 0.1),
        panel.spacing = unit(half_line, "pt"),
        panel.spacing.x = NULL,
        panel.spacing.y = NULL,
        panel.ontop = FALSE,
        strip.background = element_blank(),
        strip.clip = "inherit",
        strip.text = element_text(
          colour = "grey10",
          size = rel(0.8),
          margin = margin(0.8 * half_line,
                          0.8 * half_line, 0.8 * half_line, 0.8 * half_line)
        ),
        strip.text.x = NULL,
        strip.text.y = element_text(angle = -90),
        strip.text.y.left = element_text(angle = 90),
        strip.placement = "inside",
        strip.placement.x = NULL,
        strip.placement.y = NULL,
        strip.switch.pad.grid = unit(half_line / 2,
                                     "pt"),
        strip.switch.pad.wrap = unit(half_line / 2,
                                     "pt"),
        plot.background = element_rect(colour = "white"),
        plot.title = element_text(
          family = title_family,
          face = "bold",
          size = rel(1.4),
          hjust = 0,
          vjust = 1,
          margin = margin(b = half_line)
        ),
        plot.title.position = "panel",
        plot.subtitle = element_text(
          hjust = 0,
          vjust = 1,
          size = rel(1.25),
          margin = margin(b = half_line)
        ),
        plot.caption = element_text(
          size = rel(0.9),
          hjust = 1,
          vjust = 1,
          margin = margin(t = half_line)
        ),
        plot.caption.position = "panel",
        plot.tag = element_text(
          size = rel(1.2),
          hjust = 0.5,
          vjust = 0.5
        ),
        plot.tag.position = "topleft",
        plot.margin = margin(half_line,
                             half_line, half_line, half_line),
        complete = TRUE
      )
    ggplot2:::ggplot_global$theme_all_null %+replace% t
  }

#' Myriad map theme
#'
#' You should [import_myriad_semi]() first and also install the fonts on your
#' system before trying to use this theme.
#'
#' @title theme_myriad_map
#' @importFrom grid unit
#' @export
#' @examples
#' \dontrun{
#' }
theme_myriad_map <- function() {
  require(grid)
  theme_myriad_semi() %+replace%
    theme(axis.line=element_blank(),
          axis.text=element_blank(),
          axis.ticks=element_blank(),
          axis.title=element_blank(),
          axis.text.x=element_blank(),
          axis.text.y=element_blank(),
          panel.background=element_blank(),
          panel.border=element_blank(),
          panel.grid=element_blank(),
          panel.grid.major=element_blank(),
          panel.grid.minor=element_blank(),
          panel.spacing=unit(0, "lines"),
          plot.background=element_blank(),
          plot.title = element_text(hjust = 0),
          legend.justification = c(0,0),
          legend.position = c(0,0)
    )
}


#' Myriad map theme PDF
#'
#' You should [import_myriad_semi]() first and also install the fonts on your
#' system before trying to use this theme.
#'
#' @title theme_myriad_map
#' @importFrom grid unit
#' @export
#' @examples
#' \dontrun{
#' }
theme_myriad_map_pdf <- function() {
  require(grid)
  theme_myriad_semi_pdf() %+replace%
    theme(axis.line=element_blank(),
          axis.text=element_blank(),
          axis.ticks=element_blank(),
          axis.title=element_blank(),
          axis.text.x=element_blank(),
          axis.text.y=element_blank(),
          panel.background=element_blank(),
          panel.border=element_blank(),
          panel.grid=element_blank(),
          panel.grid.major=element_blank(),
          panel.grid.minor=element_blank(),
          panel.spacing=unit(0, "lines"),
          plot.background=element_blank(),
          plot.title = element_text(hjust = 0),
          legend.justification = c(0,0),
          legend.position = c(0,0)
    )
}


#' Myriad New York City map theme
#'
#' Map theme suitable for NYC maps.
#' You should [import_myriad_semi]() first and also install the fonts on your
#' system before trying to use this theme.
#'
#' @importFrom grid unit
#' @export
#'
#' @examples
#' \dontrun{
#' }
theme_myriad_nymap <- function() {
  require(grid)
  theme_myriad_semi() %+replace%
    theme(axis.line=element_blank(),
          axis.text=element_blank(),
          axis.ticks=element_blank(),
          axis.title=element_blank(),
          axis.text.x=element_blank(),
          axis.text.y=element_blank(),
          panel.background=element_blank(),
          panel.border=element_blank(),
          panel.grid=element_blank(),
          panel.grid.major=element_blank(),
          panel.grid.minor=element_blank(),
          panel.spacing=unit(0, "lines"),
          plot.background=element_blank(),
          plot.title = element_text(hjust = 0),
          legend.justification = c(0,0),
          legend.position = c(0.1, 0.6),
          legend.direction = "horizontal"
    )
}


#' Myriad New York City map theme PDF
#'
#' Map theme suitable for NYC maps.
#' You should [import_myriad_semi]() first and also install the fonts on your
#' system before trying to use this theme.
#'
#' @importFrom grid unit
#' @export
#'
#' @examples
#' \dontrun{
#' }
theme_myriad_nymap_pdf <- function() {
  require(grid)
  theme_myriad_semi_pdf() %+replace%
    theme(axis.line=element_blank(),
          axis.text=element_blank(),
          axis.ticks=element_blank(),
          axis.title=element_blank(),
          axis.text.x=element_blank(),
          axis.text.y=element_blank(),
          panel.background=element_blank(),
          panel.border=element_blank(),
          panel.grid=element_blank(),
          panel.grid.major=element_blank(),
          panel.grid.minor=element_blank(),
          panel.spacing=unit(0, "lines"),
          plot.background=element_blank(),
          plot.title = element_text(hjust = 0),
          legend.justification = c(0,0),
          legend.position = c(0.1, 0.6),
          legend.direction = "horizontal"
    )
}



#' PDF/showtext version of theme_myriad_semi()
#'
#' @param base_family Base font
#' @param title_family Title font
#'
#' @return ggplot2 theme
#' @export
#'
#' @examples
#' \dontrun{
#'
#' }
theme_myriad_semi_pdf <- function (base_family = "Myriad Pro PDF",
                                     title_family = "Myriad Pro PDF")
{
  theme_myriad_semi(base_family = base_family,
                    title_family = title_family)
}





