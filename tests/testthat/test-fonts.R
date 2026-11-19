test_that("check_font() accepts registered fonts without require_font()", {
  withr::defer({
    systemfonts::clear_registry()
    register_myriad_fonts()
  })
  systemfonts::clear_registry()
  local_mocked_bindings(
    require_font = function(...) cli::cli_abort("Should not be called."),
    .package = "systemfonts"
  )

  import_myriad_semi()

  expect_true(check_font("Myriad Pro SemiCondensed"))
  expect_true(check_font("Myriad Pro Semibold SemiCondensed"))
})

test_that("check_font() falls back to require_font() for unregistered fonts", {
  required <- character()
  local_mocked_bindings(
    require_font = function(family, ...) {
      required <<- c(required, family)
      invisible(TRUE)
    },
    .package = "systemfonts"
  )

  check_font("Not A Registered Font")

  expect_equal(required, "Not A Registered Font")
})

test_that("theme_myriad_semi() works after import_myriad_semi()", {
  withr::defer({
    systemfonts::clear_registry()
    register_myriad_fonts()
  })
  systemfonts::clear_registry()
  local_mocked_bindings(
    require_font = function(...) cli::cli_abort("Should not be called."),
    .package = "systemfonts"
  )

  import_myriad_semi()
  t <- theme_myriad_semi()

  expect_equal(t$text$family, "Myriad Pro SemiCondensed")
  expect_equal(t$plot.title$family, "Myriad Pro Semibold SemiCondensed")
})

test_that("register_myriad_fonts() registers the Myriad families", {
  registered <- list()
  local_mocked_bindings(find_font_file = function(ps_name) {
    paste0("/fonts/", ps_name, ".otf")
  })
  local_mocked_bindings(
    register_font = function(name, plain, ...) {
      registered[[name]] <<- plain
    },
    .package = "systemfonts"
  )
  local_mocked_bindings(font_add = function(...) NULL, .package = "sysfonts")

  register_myriad_fonts()

  expect_equal(
    registered,
    list(
      "Myriad Pro SemiCondensed" = "/fonts/MyriadPro-SemiCn.otf",
      "Myriad Pro Semibold SemiCondensed" = "/fonts/MyriadPro-SemiboldSemiCn.otf",
      "Myriad Pro Condensed" = "/fonts/MyriadPro-Cond.otf"
    )
  )
})

test_that("register_myriad_fonts() doesn't error when Myriad is missing", {
  local_mocked_bindings(find_font_file = function(ps_name) NA_character_)

  expect_no_error(register_myriad_fonts())
  expect_error(import_myriad_semi(), "Can't find the font file")
})

test_that("find_font_file() prefers the package copy of a font", {
  font_dir <- withr::local_tempdir()
  file.create(file.path(font_dir, "MyriadPro-SemiCn.otf"))

  expect_equal(
    find_font_file("MyriadPro-SemiCn", font_dir = font_dir),
    file.path(font_dir, "MyriadPro-SemiCn.otf")
  )
})

test_that("find_font_file() falls back to installed system fonts", {
  local_mocked_bindings(
    system_fonts = function() {
      data.frame(
        path = "/Library/Fonts/MyriadPro-SemiCn.otf",
        name = "MyriadPro-SemiCn"
      )
    },
    .package = "systemfonts"
  )
  font_dir <- withr::local_tempdir()

  expect_equal(
    find_font_file("MyriadPro-SemiCn", font_dir = font_dir),
    "/Library/Fonts/MyriadPro-SemiCn.otf"
  )
  expect_equal(
    find_font_file("MyriadPro-Nope", font_dir = font_dir),
    NA_character_
  )
})

test_that("import_myriad_semi() makes the families available to showtext", {
  skip_if(is.na(find_font_file("MyriadPro-SemiCn")))

  import_myriad_semi()

  expect_contains(
    sysfonts::font_families(),
    c("Myriad Pro SemiCondensed", "Myriad Pro Semibold SemiCondensed")
  )
})
