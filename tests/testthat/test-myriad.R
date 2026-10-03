library(ggplot2)

test_that("theme_myriad_semi() returns a complete theme with Myriad defaults", {
  t <- theme_myriad_semi()

  expect_s3_class(t, "theme")
  expect_true(attr(t, "complete"))
  expect_equal(t$text$family, "Myriad Pro SemiCondensed")
  expect_equal(t$plot.title$family, "Myriad Pro Semibold SemiCondensed")
  expect_equal(t$legend.position, "top")
  expect_equal(t$palette.colour.discrete[[1]], "#E69F00")
  expect_equal(t$palette.fill.discrete, t$palette.colour.discrete)
})

test_that("theme_myriad_semi() passes its arguments through", {
  t <- theme_myriad_semi(
    base_size = 10,
    header_family = "Myriad Pro SemiCondensed",
    ink = "grey20",
    paper = "grey95"
  )

  expect_equal(t$text$size, 10)
  expect_equal(t$text$colour, "grey20")
  expect_equal(t$rect$fill, "grey95")
  expect_equal(t$plot.title$family, "Myriad Pro SemiCondensed")
})

test_that("theme_myriad_map() blanks axes and puts the legend at the bottom", {
  t <- theme_myriad_map()

  expect_s3_class(t$axis.text, "element_blank")
  expect_s3_class(t$panel.grid, "element_blank")
  expect_equal(t$legend.position, "bottom")
  expect_equal(t$legend.title.position, "top")
})

test_that("theme_myriad_nymap() places the legend inside the panel", {
  t <- theme_myriad_nymap()

  expect_s3_class(t$axis.text, "element_blank")
  expect_equal(t$legend.position, "inside")
  expect_equal(t$legend.position.inside, c(0.1, 0.6))
})

test_that("theme_socviz_semi() returns a complete theme with book defaults", {
  t <- theme_socviz_semi()

  expect_s3_class(t, "theme")
  expect_true(attr(t, "complete"))
  expect_equal(t$text$family, "Socviz Condensed")
  expect_equal(t$plot.title$family, "Socviz SemiCondensed")
  expect_equal(t$legend.position, "top")
  expect_equal(t$palette.colour.discrete[[1]], "#E69F00")
  expect_equal(t$palette.fill.discrete, t$palette.colour.discrete)
})

test_that("theme_socviz_semi() passes its arguments through", {
  t <- theme_socviz_semi(
    base_size = 10,
    header_family = "Socviz Condensed",
    ink = "grey20",
    paper = "grey95"
  )

  expect_equal(t$text$size, 10)
  expect_equal(t$text$colour, "grey20")
  expect_equal(t$rect$fill, "grey95")
  expect_equal(t$plot.title$family, "Socviz Condensed")
})

test_that("theme_socviz_map() blanks axes and puts the legend at the bottom", {
  t <- theme_socviz_map()

  expect_s3_class(t$axis.text, "element_blank")
  expect_s3_class(t$axis.title.y.right, "element_blank")
  expect_s3_class(t$panel.grid, "element_blank")
  expect_equal(t$legend.position, "bottom")
  expect_equal(t$legend.title.position, "top")
})

test_that("theme_socviz_nymap() places the legend inside the panel", {
  t <- theme_socviz_nymap()

  expect_s3_class(t$axis.text, "element_blank")
  expect_equal(t$legend.position, "inside")
  expect_equal(t$legend.position.inside, c(0.1, 0.6))
  expect_equal(t$legend.direction, "horizontal")
})

test_that("theme_socviz_kjh aliases match the themes they alias", {
  expect_identical(theme_socviz_kjh, theme_socviz_semi)
  expect_identical(theme_socviz_kjh_map, theme_socviz_map)
  expect_identical(theme_socviz_kjh_nymap, theme_socviz_nymap)
  expect_equal(theme_socviz_kjh(base_size = 10)$text$size, 10)
})
