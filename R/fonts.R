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
#' This will work for devices that use `systemfonts` to process fonts.
#' For PDFs, use showtext::showtext_auto() beforehand
#'
#' @return Makes "Myriad SemiCondensed" available for use
#' @export
#'
#' @examples
#' \dontrun{
#' }
import_myriad_semi <- function() {
  myriad_font_dir <- system.file("fonts", "myriad-pro", package = "myriad")

  systemfonts::register_font(
    name = "Myriad Pro SemiCondensed",
    plain = paste0(myriad_font_dir, "/", "MyriadPro-SemiCn.otf"),
    bold = paste0(myriad_font_dir, "/", "MyriadPro-SemiboldSemiCn.otf"),
    italic = paste0(myriad_font_dir, "/", "MyriadPro-SemiboldSemiCnIt.otf"),
    bolditalic = paste0(myriad_font_dir, "/", "MyriadPro-SemiboldCondIt.otf")
  )
}


#' Import Myriad Condensed only
#'
#' @return Makes "Myriad Condensed" available for use
#' @export
#'
#' @examples
#' \dontrun{
#' }
import_myriad_condensed <- function() {
  myriad_font_dir <- system.file("fonts", "myriad-pro", package = "myriad")
  systemfonts::register_font(
    name = "Myriad Pro Condensed",
    plain = paste0(myriad_font_dir, "/", "MyriadPro-Cond.otf"),
    bold = paste0(myriad_font_dir, "/", "MyriadPro-BoldCond.otf"),
    italic = paste0(myriad_font_dir, "/", "MyriadPro-CondIt.otf"),
    bolditalic = paste0(myriad_font_dir, "/", "MyriadPro-BoldCondIt.otf")
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
