#' A [ggplot2] theme using semibold variants of Adobe Myriad Pro
#'
#' You should [import_myriad_semi]() first and also install the fonts on your
#' system before trying to use this theme. Requires ggplot2 4.0.0 or later. The
#' theme carries its own discrete colour and fill palette.
#'
#' @title theme_myriad_semi
#' @param base_family,header_family,base_size,base_line_size,base_rect_size base
#'   font family, title font family, and sizes
#' @param ink,paper,accent foreground, background, and accent colours
#' @export
#' @examples \dontrun{
#' }
#' @author Kieran Healy
theme_myriad_semi <- function(
  base_size = 12,
  base_family = "Myriad Pro SemiCondensed",
  header_family = "Myriad Pro Semibold SemiCondensed",
  base_line_size = base_size / 24,
  base_rect_size = base_size / 24,
  ink = "black",
  paper = "white",
  accent = "#0072B2"
) {
  systemfonts::require_font(
    "Myriad Pro SemiCondensed",
    fallback = "Helvetica Neue"
  )
  systemfonts::require_font(
    "Myriad Pro Semibold SemiCondensed",
    fallback = "Helvetica Neue"
  )

  half_line <- base_size / 2
  quarter_line <- base_size / 4

  discrete_palette <- c(
    "#E69F00",
    "#56B4E9",
    "#009E73",
    "#D55E00",
    "#CC79A7",
    "#0072B2",
    "#F0E442",
    "#000000"
  )

  t <- ggplot2::theme_minimal(
    base_size = base_size,
    base_family = base_family,
    base_line_size = base_line_size,
    base_rect_size = base_rect_size,
    ink = ink,
    paper = paper
  )

  ## Base elements and geom defaults
  t <- t +
    theme(
      line = element_line(
        colour = ink,
        linewidth = base_line_size,
        linetype = 1,
        lineend = "butt"
      ),
      rect = element_rect(
        fill = paper,
        colour = ink,
        linewidth = base_rect_size,
        linetype = 1
      ),
      text = element_text(
        family = base_family,
        face = "plain",
        colour = ink,
        size = base_size,
        lineheight = 0.9,
        hjust = 0.5,
        vjust = 0.5,
        angle = 0
      ),
      geom = element_geom(
        ink = ink,
        paper = paper,
        accent = accent,
        family = base_family,
        fontsize = base_size
      )
    )

  ## Axes: shared properties
  t <- t +
    theme_sub_axis(
      line = element_line(color = "gray10", linewidth = 0.5),
      text = element_text(color = ink, size = base_size * 1.3),
      ticks = element_line(colour = "grey10"),
      ticks.length = unit(quarter_line, "pt"),
      title = element_text(size = base_size * 1.2)
    )

  ## Axes: x-axis specifics
  t <- t +
    theme_sub_axis_x(
      text = element_text(
        margin = margin(t = 0.8 * half_line / 2),
        vjust = 1
      ),
      title = element_text(
        margin = margin(t = half_line / 2),
        vjust = 1
      )
    ) +
    theme_sub_axis_top(
      text = element_text(
        margin = margin(b = 0.8 * half_line / 2),
        vjust = 0
      ),
      title = element_text(
        margin = margin(b = half_line / 2),
        vjust = 0
      )
    )

  ## Axes: y-axis specifics
  t <- t +
    theme_sub_axis_y(
      text = element_text(
        margin = margin(r = 0.8 * half_line / 2),
        hjust = 1
      ),
      title = element_text(
        angle = 90,
        margin = margin(r = half_line / 2),
        vjust = 1
      )
    ) +
    theme_sub_axis_right(
      text = element_text(
        margin = margin(l = 0.8 * half_line / 2),
        hjust = 0
      ),
      title = element_text(
        angle = -90,
        margin = margin(l = half_line / 2),
        vjust = 0
      )
    )

  ## Legend
  t <- t +
    theme_sub_legend(
      background = element_blank(),
      spacing = unit(base_size, "pt"),
      margin = margin(half_line, half_line, half_line, half_line),
      key = element_rect(fill = paper, colour = NA),
      key.size = unit(1.2, "lines"),
      text = element_text(size = base_size * 0.9),
      title = element_text(hjust = 0),
      position = "top",
      direction = "horizontal",
      box = "horizontal",
      justification = "center",
      box.margin = margin(0, 0, 0, 0, "cm"),
      box.background = element_blank(),
      box.spacing = unit(base_size, "pt")
    )

  ## Panel
  t <- t +
    theme_sub_panel(
      background = element_rect(fill = paper, colour = NA),
      border = element_blank(),
      grid = element_line(colour = "gray90", linewidth = 0.1),
      grid.major = element_line(colour = "gray90", linewidth = 0.1),
      grid.minor = element_line(colour = "gray90", linewidth = 0.1),
      spacing = unit(half_line, "pt"),
      ontop = FALSE
    )

  ## Strips
  t <- t +
    theme_sub_strip(
      background = element_blank(),
      clip = "inherit",
      text = element_text(
        colour = "grey10",
        size = base_size * 1.1,
        margin = margin(
          0.8 * half_line,
          0.8 * half_line,
          0.8 * half_line,
          0.8 * half_line
        )
      ),
      text.y = element_text(angle = -90),
      text.y.left = element_text(angle = 90),
      placement = "inside",
      switch.pad.grid = unit(quarter_line, "pt"),
      switch.pad.wrap = unit(quarter_line, "pt")
    )

  ## Plot chrome
  t <- t +
    theme_sub_plot(
      background = element_rect(colour = paper),
      title = element_text(
        family = header_family,
        face = "bold",
        size = base_size * 1.4,
        hjust = 0,
        vjust = 1,
        margin = margin(b = half_line)
      ),
      title.position = "panel",
      subtitle = element_text(
        hjust = 0,
        vjust = 1,
        size = base_size * 1.25,
        margin = margin(b = half_line)
      ),
      caption = element_text(
        size = base_size * 0.9,
        hjust = 1,
        vjust = 1,
        margin = margin(t = half_line)
      ),
      caption.position = "panel",
      tag = element_text(
        size = base_size * 1.2,
        hjust = 0.5,
        vjust = 0.5
      ),
      tag.position = "topleft",
      margin = margin(half_line, half_line, half_line, half_line)
    )

  ## Discrete palette: travels with the theme
  t <- t +
    theme(
      palette.colour.discrete = discrete_palette,
      palette.fill.discrete = discrete_palette
    )

  t
}


#' Myriad map theme
#'
#' You should [import_myriad_semi]() first and also install the fonts on your
#' system before trying to use this theme.
#'
#' @title theme_myriad_map
#' @export
#' @examples
#' \dontrun{
#' }
theme_myriad_map <- function() {
  theme_myriad_semi() %+replace%
    theme(
      axis.line = element_blank(),
      axis.text = element_blank(),
      axis.text.x = element_blank(),
      axis.text.x.top = element_blank(),
      axis.text.y = element_blank(),
      axis.text.y.right = element_blank(),
      axis.ticks = element_blank(),
      axis.title = element_blank(),
      axis.title.x = element_blank(),
      axis.title.x.top = element_blank(),
      axis.title.y = element_blank(),
      axis.title.y.right = element_blank(),
      panel.background = element_blank(),
      panel.border = element_blank(),
      panel.grid = element_blank(),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      panel.spacing = unit(0, "lines"),
      plot.background = element_blank(),
      plot.title = element_text(hjust = 0),
      legend.justification = c(0, 0),
      legend.position = "bottom",
      legend.title.position = "top",
      legend.key.height = unit(0.75, "lines")
    )
}


#' Myriad New York City map theme
#'
#' Map theme suitable for NYC maps. As [theme_myriad_map()], but with the
#' legend placed inside the plot area.
#'
#' @importFrom grid unit
#' @export
#'
#' @examples
#' \dontrun{
#' }
theme_myriad_nymap <- function() {
  theme_myriad_map() %+replace%
    theme(
      legend.position = "inside",
      legend.position.inside = c(0.1, 0.6),
      legend.direction = "horizontal"
    )
}

#' A [ggplot2] theme using the Socviz variants of Adobe Myriad Pro
#'
#' You should [import_socviz_condensed]() and [import_socviz_semi]() first and
#' also install the fonts on your system before trying to use this theme.
#' Requires ggplot2 4.0.0 or later. The theme carries its own discrete colour
#' and fill palette.
#'
#' @title theme_socviz_semi
#' @param base_family,header_family,base_size,base_line_size,base_rect_size base
#'   font family, title font family, and sizes
#' @param ink,paper,accent foreground, background, and accent colours
#' @export
#' @examples \dontrun{
#' }
#' @author Kieran Healy
theme_socviz_semi <- function(
  base_size = 12,
  base_family = "Socviz Condensed",
  header_family = "Socviz SemiCondensed",
  base_line_size = base_size / 24,
  base_rect_size = base_size / 24,
  ink = "black",
  paper = "white",
  accent = "#0072B2"
) {
  systemfonts::require_font("Socviz Condensed", fallback = "Helvetica Neue")
  systemfonts::require_font("Socviz SemiCondensed", fallback = "Helvetica Neue")

  half_line <- base_size / 2
  quarter_line <- base_size / 4

  discrete_palette <- c(
    "#E69F00",
    "#56B4E9",
    "#009E73",
    "#D55E00",
    "#CC79A7",
    "#0072B2",
    "#F0E442",
    "#000000"
  )

  t <- ggplot2::theme_minimal(
    base_size = base_size,
    base_family = base_family,
    base_line_size = base_line_size,
    base_rect_size = base_rect_size,
    ink = ink,
    paper = paper
  )

  ## Base elements and geom defaults
  t <- t +
    theme(
      line = element_line(
        colour = ink,
        linewidth = base_line_size,
        linetype = 1,
        lineend = "butt"
      ),
      rect = element_rect(
        fill = paper,
        colour = ink,
        linewidth = base_rect_size,
        linetype = 1
      ),
      text = element_text(
        family = base_family,
        face = "plain",
        colour = ink,
        size = base_size,
        lineheight = 0.9,
        hjust = 0.5,
        vjust = 0.5,
        angle = 0
      ),
      geom = element_geom(
        ink = ink,
        paper = paper,
        accent = accent,
        family = base_family,
        fontsize = base_size
      )
    )

  ## Axes: shared properties
  t <- t +
    theme_sub_axis(
      line = element_line(color = "gray10", linewidth = 0.5),
      text = element_text(color = ink, size = base_size * 1.3),
      ticks = element_line(colour = "grey10"),
      ticks.length = unit(quarter_line, "pt"),
      title = element_text(size = base_size * 1.2)
    )

  ## Axes: x-axis specifics
  t <- t +
    theme_sub_axis_x(
      text = element_text(
        margin = margin(t = 0.8 * half_line / 2),
        vjust = 1
      ),
      title = element_text(
        margin = margin(t = half_line / 2),
        vjust = 1
      )
    ) +
    theme_sub_axis_top(
      text = element_text(
        margin = margin(b = 0.8 * half_line / 2),
        vjust = 0
      ),
      title = element_text(
        margin = margin(b = half_line / 2),
        vjust = 0
      )
    )

  ## Axes: y-axis specifics
  t <- t +
    theme_sub_axis_y(
      text = element_text(
        margin = margin(r = 0.8 * half_line / 2),
        hjust = 1
      ),
      title = element_text(
        angle = 90,
        margin = margin(r = half_line / 2),
        vjust = 1
      )
    ) +
    theme_sub_axis_right(
      text = element_text(
        margin = margin(l = 0.8 * half_line / 2),
        hjust = 0
      ),
      title = element_text(
        angle = -90,
        margin = margin(l = half_line / 2),
        vjust = 0
      )
    )

  ## Legend
  t <- t +
    theme_sub_legend(
      background = element_blank(),
      spacing = unit(base_size, "pt"),
      margin = margin(half_line, half_line, half_line, half_line),
      key = element_rect(fill = paper, colour = NA),
      key.size = unit(1.2, "lines"),
      text = element_text(size = base_size * 0.9),
      title = element_text(hjust = 0),
      position = "top",
      direction = "horizontal",
      box = "horizontal",
      justification = "center",
      box.margin = margin(0, 0, 0, 0, "cm"),
      box.background = element_blank(),
      box.spacing = unit(base_size, "pt")
    )

  ## Panel
  t <- t +
    theme_sub_panel(
      background = element_rect(fill = paper, colour = NA),
      border = element_blank(),
      grid = element_line(colour = "gray90", linewidth = 0.1),
      grid.major = element_line(colour = "gray90", linewidth = 0.1),
      grid.minor = element_line(colour = "gray90", linewidth = 0.1),
      spacing = unit(half_line, "pt"),
      ontop = FALSE
    )

  ## Strips
  t <- t +
    theme_sub_strip(
      background = element_blank(),
      clip = "inherit",
      text = element_text(
        colour = "grey10",
        size = base_size * 1.1,
        margin = margin(
          0.8 * half_line,
          0.8 * half_line,
          0.8 * half_line,
          0.8 * half_line
        )
      ),
      text.y = element_text(angle = -90),
      text.y.left = element_text(angle = 90),
      placement = "inside",
      switch.pad.grid = unit(quarter_line, "pt"),
      switch.pad.wrap = unit(quarter_line, "pt")
    )

  ## Plot chrome
  t <- t +
    theme_sub_plot(
      background = element_rect(colour = paper),
      title = element_text(
        family = header_family,
        face = "bold",
        size = base_size * 1.4,
        hjust = 0,
        vjust = 1,
        margin = margin(b = half_line)
      ),
      title.position = "panel",
      subtitle = element_text(
        hjust = 0,
        vjust = 1,
        size = base_size * 1.25,
        margin = margin(b = half_line)
      ),
      caption = element_text(
        size = base_size * 0.9,
        hjust = 1,
        vjust = 1,
        margin = margin(t = half_line)
      ),
      caption.position = "panel",
      tag = element_text(
        size = base_size * 1.2,
        hjust = 0.5,
        vjust = 0.5
      ),
      tag.position = "topleft",
      margin = margin(half_line, half_line, half_line, half_line)
    )

  ## Discrete palette: travels with the theme
  t <- t +
    theme(
      palette.colour.discrete = discrete_palette,
      palette.fill.discrete = discrete_palette
    )

  t
}

#' @rdname theme_socviz_semi
#' @export
theme_socviz_kjh <- theme_socviz_semi


#' Socviz map theme
#'
#' You should [import_socviz_condensed]() and [import_socviz_semi]() first and
#' also install the fonts on your system before trying to use this theme.
#'
#' @title theme_socviz_map
#' @importFrom grid unit
#' @export
#' @examples
#' \dontrun{
#' }
theme_socviz_map <- function() {
  theme_socviz_semi() %+replace%
    theme(
      axis.line = element_blank(),
      axis.text = element_blank(),
      axis.text.x = element_blank(),
      axis.text.x.top = element_blank(),
      axis.text.y = element_blank(),
      axis.text.y.right = element_blank(),
      axis.ticks = element_blank(),
      axis.title = element_blank(),
      axis.title.x = element_blank(),
      axis.title.x.top = element_blank(),
      axis.title.y = element_blank(),
      axis.title.y.right = element_blank(),
      panel.background = element_blank(),
      panel.border = element_blank(),
      panel.grid = element_blank(),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      panel.spacing = unit(0, "lines"),
      plot.background = element_blank(),
      plot.title = element_text(hjust = 0),
      legend.justification = c(0, 0),
      legend.position = "bottom",
      legend.title.position = "top",
      legend.key.height = unit(0.75, "lines")
    )
}

#' @rdname theme_socviz_map
#' @export
theme_socviz_kjh_map <- theme_socviz_map


#' Socviz New York City map theme
#'
#' Map theme suitable for NYC maps. As [theme_socviz_map()], but with the
#' legend placed inside the plot area.
#'
#' @importFrom grid unit
#' @export
#'
#' @examples
#' \dontrun{
#' }
theme_socviz_nymap <- function() {
  theme_socviz_map() %+replace%
    theme(
      legend.position = "inside",
      legend.position.inside = c(0.1, 0.6),
      legend.direction = "horizontal"
    )
}

#' @rdname theme_socviz_nymap
#' @export
theme_socviz_kjh_nymap <- theme_socviz_nymap
