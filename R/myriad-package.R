#' @keywords internal
#' @import ggplot2
"_PACKAGE"

.onLoad <- function(libname, pkgname) {
  register_myriad_fonts()
}

# Myriad Pro can't be distributed with the package. Register whichever
# families can be found, without failing the package load.
register_myriad_fonts <- function() {
  try(import_myriad_semi(), silent = TRUE)
  try(import_myriad_condensed(), silent = TRUE)
}
