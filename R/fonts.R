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


#' Import Myriad SemiCondensed for use in PDFs
#'
#' @return Makes "Myriad Semi PDF" available for use in PDFs only
#' @export
#'
#' @examples
#' \dontrun{
#' }
import_myriad_pdf <- function() {
  myriad_font_dir <- system.file("fonts", "myriad-pro", package = "myriad")
  sysfonts::font_add("Myriad Pro PDF",
                     regular = paste0(myriad_font_dir, "/", "MyriadPro-SemiCn.otf"),
                     bold = paste0(myriad_font_dir, "/", "MyriadPro-BoldSemiCn.otf"),
                     italic = paste0(myriad_font_dir, "/", "MyriadPro-SemiboldSemiCnIt.otf"),
                     bolditalic = paste0(myriad_font_dir, "/", "MyriadPro-SemiboldCondIt.otf"))
}


#' Import Myriad Condensed for used in PDFs
#'
#' @return Makes "Myriad Condensed PDF" available for use in PDFs only
#' @export
#'
#' @examples
#' \dontrun{
#' }
import_myriad_condensed_pdf <- function() {
  myriad_font_dir <- system.file("fonts", "myriad-pro", package = "myriad")
  sysfonts::font_add("Myriad Pro Condensed PDF",
                     regular = paste0(myriad_font_dir, "/", "MyriadPro-Cond.otf"),
                     bold = paste0(myriad_font_dir, "/", "MyriadPro-BoldCond.otf"),
                     italic = paste0(myriad_font_dir, "/", "MyriadPro-CondIt.otf"),
                     bolditalic = paste0(myriad_font_dir, "/", "MyriadPro-BoldCondIt.otf"))
}


#' Hack ggsave for use with showtext when making PDFs
#'
#' This is gross
#'
#' @param filename ggsave
#' @param plot ggsave
#' @param device ggsave
#' @param path ggsave
#' @param scale ggsave
#' @param width ggsave
#' @param height ggsave
#' @param units ggsave
#' @param dpi ggsave
#' @param limitsize ggsave
#' @param bg ggsave
#' @param ... ggsave
#'
#' @return A showtexted plot
#' @export
#'
#' @examples
#' \dontrun{
#' }
pdf_ggsave <- function (filename, plot = last_plot(), device = "pdf", path = NULL,
                       scale = 1, width = NA, height = NA,
                       units = c("in", "cm", "mm", "px"),
                       dpi = 300, limitsize = TRUE, bg = NULL,
                       ...)
{
  dpi <- ggplot2:::parse_dpi(dpi)
  dev <- ggplot2:::plot_dev(device, filename, dpi = dpi)
  dim <- ggplot2:::plot_dim(c(width, height), scale = scale, units = units,
                            limitsize = limitsize, dpi = dpi)
  if (!is.null(path)) {
    filename <- file.path(path, filename)
  }
  if (is_null(bg)) {
    bg <- ggplot2:::calc_element("plot.background",
                                 ggplot2:::plot_theme(plot))$fill %||% "transparent"
  }
  old_dev <- grDevices::dev.cur()
  dev(filename = filename, width = dim[1], height = dim[2],
      bg = bg, ...)
  showtext::showtext_opts(dpi = 300)
  showtext::showtext_begin()
  on.exit(utils::capture.output({
    grDevices::dev.off()
    if (old_dev > 1) grDevices::dev.set(old_dev)
  }))
  grid::grid.draw(plot)
  showtext::showtext_end()
  invisible(filename)
}


#' @rdname pdf_ggsave
#' @examples
#' \dontrun{
#' ggsave_pdf()
#' }
#' @export
ggsave_pdf <- pdf_ggsave
