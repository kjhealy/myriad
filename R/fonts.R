#' Import all Myriad Pro font faces and styles for use in graphs
#' as "Myriad Pro".
#'
#' This will work for devices that use `systemfonts` to process fonts.
#' For PDFs, use showtext::showtext_auto() beforehand
#'
#' @param font_family The font family you want to import
#' @param silent Report on what's been imported or not
#' @note Modified from https://yjunechoe.github.io/posts/2021-06-24-setting-up-and-debugging-custom-fonts/.
#' @export
import_myriad <- function(font_family = "Myriad Pro", silent = TRUE) {
  font_specs <- systemfonts::system_fonts() |>
    dplyr::filter(family == font_family) |>
    dplyr::mutate(family = paste(font_family, style)) |>
    dplyr::select(plain = path, name = family)

  purrr::pwalk(as.list(font_specs), systemfonts::register_font)

  if (!silent) {
    message(paste0(
      "Hoisted ",
      nrow(font_specs),
      " variants:\n",
      paste(font_specs$name, collapse = "\n")
    ))
  }
}


#' Import Myriad SemiCondensed only
#'
#' Registers the SemiCondensed faces of Myriad Pro under their own family
#' names. Each face is taken from the package's `fonts/myriad-pro` directory
#' if present there, and otherwise from the fonts installed on the system.
#' This will work for devices that use `systemfonts` to process fonts.
#' For PDFs, use showtext::showtext_auto() beforehand
#'
#' @return Makes "Myriad Pro SemiCondensed" and "Myriad Pro Semibold
#'   SemiCondensed" available for use
#' @export
#'
#' @examples
#' \dontrun{
#' }
import_myriad_semi <- function() {
  register_myriad_family(
    "Myriad Pro SemiCondensed",
    plain = "MyriadPro-SemiCn",
    bold = "MyriadPro-SemiboldSemiCn",
    italic = "MyriadPro-SemiCnIt",
    bolditalic = "MyriadPro-SemiboldSemiCnIt"
  )
  register_myriad_family(
    "Myriad Pro Semibold SemiCondensed",
    plain = "MyriadPro-SemiboldSemiCn",
    bold = "MyriadPro-SemiboldSemiCn",
    italic = "MyriadPro-SemiboldSemiCnIt",
    bolditalic = "MyriadPro-SemiboldSemiCnIt"
  )
}


#' Import Myriad Condensed only
#'
#' Registers the Condensed faces of Myriad Pro under their own family name.
#' Each face is taken from the package's `fonts/myriad-pro` directory if
#' present there, and otherwise from the fonts installed on the system.
#'
#' @return Makes "Myriad Pro Condensed" available for use
#' @export
#'
#' @examples
#' \dontrun{
#' }
import_myriad_condensed <- function() {
  register_myriad_family(
    "Myriad Pro Condensed",
    plain = "MyriadPro-Cond",
    bold = "MyriadPro-BoldCond",
    italic = "MyriadPro-CondIt",
    bolditalic = "MyriadPro-BoldCondIt"
  )
}

#' Import Socviz Semicondensed
#'
#' @return Makes "Socviz SemiCondensed" available for use
#' @export
#'
#' @examples
#' \dontrun{
#' }
import_socviz_semi <- function() {
  myriad_font_dir <- system.file("fonts", "myriad-pro", package = "myriad")

  sysfonts::font_add(
    "Socviz SemiCondensed",
    regular = paste0(myriad_font_dir, "/", "SocvizSemiCondensed-Regular.otf"),
    bold = paste0(myriad_font_dir, "/", "SocvizSemiCondensed-Bold.otf"),
    italic = paste0(myriad_font_dir, "/", "SocvizSemiCondensed-Italic.otf"),
    bolditalic = paste0(myriad_font_dir, "/", "SocvizSemiCondensed-BoldIta.otf")
  )
}


#' Import Socviz Condensed
#'
#' @return Makes "Socviz Condensed" available for use
#' @export
#'
#' @examples
#' \dontrun{
#' }
import_socviz_condensed <- function() {
  myriad_font_dir <- system.file("fonts", "myriad-pro", package = "myriad")

  sysfonts::font_add(
    "Socviz Condensed",
    regular = paste0(myriad_font_dir, "/", "SocvizCondensed-Regular.otf"),
    bold = paste0(myriad_font_dir, "/", "SocvizCondensed-Bold.otf"),
    italic = paste0(myriad_font_dir, "/", "SocvizCondensed-Italic.otf"),
    bolditalic = paste0(myriad_font_dir, "/", "SocvizCondensed-BoldItalic.otf")
  )
}


#' Copy Myriad Pro and Socviz fonts from ~/Library/Fonts to the myriad package
#'
#' Not a portable solution. Only works on MacOS. Assumes you have the fonts
#' installed in ~/Library/Fonts
#'
#' @return Puts the fonts in the right place for use with this package
#' @export
#'
#' @examples
#' \dontrun{
#' }
copy_myriad_fonts <- function() {
  myriad_font_dir <- system.file("fonts", "myriad-pro", package = "myriad")
  myriad_fonts <- list.files(
    "~/Library/fonts",
    pattern = "Myriad.*otf",
    full.names = TRUE
  )

  socviz_fonts <- list.files(
    "~/Library/fonts",
    pattern = "Socviz.*otf",
    full.names = TRUE
  )

  file.copy(
    from = c(myriad_fonts, socviz_fonts),
    to = myriad_font_dir,
    overwrite = TRUE
  )
}


# Fonts added with systemfonts::register_font() live in the registry, which
# systemfonts::require_font() does not consult.
check_font <- function(family, fallback = "Helvetica Neue") {
  registered <- tolower(systemfonts::registry_fonts()$family)
  if (tolower(family) %in% registered) {
    return(invisible(TRUE))
  }
  systemfonts::require_font(family, fallback = fallback)
}


# Faces are given as PostScript names, which match the Adobe file names.
register_myriad_family <- function(name, plain, bold, italic, bolditalic) {
  faces <- c(
    plain = plain,
    bold = bold,
    italic = italic,
    bolditalic = bolditalic
  )
  paths <- purrr::map_chr(faces, find_font_file)

  if (is.na(paths[["plain"]])) {
    cli::cli_abort(c(
      "Can't find the font file for {.val {plain}}.",
      "i" = "Install Myriad Pro on the system, or copy it into the package with {.fn copy_myriad_fonts}."
    ))
  }
  paths[is.na(paths)] <- paths[["plain"]]

  # systemfonts serves devices such as ragg; sysfonts serves showtext.
  systemfonts::register_font(
    name = name,
    plain = paths[["plain"]],
    bold = paths[["bold"]],
    italic = paths[["italic"]],
    bolditalic = paths[["bolditalic"]]
  )
  sysfonts::font_add(
    name,
    regular = paths[["plain"]],
    bold = paths[["bold"]],
    italic = paths[["italic"]],
    bolditalic = paths[["bolditalic"]]
  )
}

find_font_file <- function(
  ps_name,
  font_dir = system.file("fonts", "myriad-pro", package = "myriad")
) {
  local_path <- file.path(font_dir, paste0(ps_name, ".otf"))
  if (nzchar(font_dir) && file.exists(local_path)) {
    return(local_path)
  }

  installed <- systemfonts::system_fonts()
  paths <- installed$path[installed$name == ps_name]
  if (length(paths) == 0) {
    return(NA_character_)
  }
  paths[[1]]
}
