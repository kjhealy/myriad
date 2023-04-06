#' Import all Myriad Pro font faces and styles for use in graphs
#' as "Myriad Pro".
#' This will work for devices that use systemfonts to process fonts
#' But it won't work for PDFs, including ggsave() where the output is a PDF
#' Use showtext::showtext_auto() beforehand
#'
#' @param family The font family you want to import
#' @param silent Report on what's been imported or not
#' @note From https://yjunechoe.github.io/posts/2021-06-24-setting-up-and-debugging-custom-fonts/.
#' @export
import_myriad <- function(family = "Myriad Pro", silent = TRUE) {
  font_specs <- systemfonts::system_fonts() %>%
    dplyr::filter(family == .env[["family"]]) %>%
    dplyr::mutate(family = paste(.data[["family"]], .data[["style"]])) %>%
    dplyr::select(plain = .data[["path"]], name = .data[["family"]])

  purrr::pwalk(as.list(font_specs), systemfonts::register_font)

  if (!silent)  message(paste0("Hoisted ", nrow(font_specs), " variants:\n",
                               paste(font_specs$name, collapse = "\n")))
}


#' Import Myriad SemiCondensed only
#'
#' @return Makes "Myriad SemiCondensed" available for use
#' @export
#'
#' @examples
#' \dontrun{
#' }
import_myriad_semi <- function() {
  myriad_font_dir <- system.file("fonts", "myriad-pro", package = "myriad")
  sysfonts::font_add("Myriad Pro SemiCondensed",
                     regular = paste0(myriad_font_dir, "/", "MyriadPro-SemiCn.otf"),
                     bold = paste0(myriad_font_dir, "/", "MyriadPro-BoldSemiCn.otf"),
                     italic = paste0(myriad_font_dir, "/", "MyriadPro-SemiboldSemiCnIt.otf"),
                     bolditalic = paste0(myriad_font_dir, "/", "MyriadPro-SemiboldCondIt.otf"))
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
  sysfonts::font_add("Myriad Pro Condensed",
                     regular = paste0(myriad_font_dir, "/", "MyriadPro-Cond.otf"),
                     bold = paste0(myriad_font_dir, "/", "MyriadPro-BoldCond.otf"),
                     italic = paste0(myriad_font_dir, "/", "MyriadPro-CondIt.otf"),
                     bolditalic = paste0(myriad_font_dir, "/", "MyriadPro-BoldCondIt.otf"))
}



