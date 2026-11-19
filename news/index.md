# Changelog

## myriad 0.10.0

- myriad now registers the Myriad Pro SemiCondensed and Condensed
  families when it is loaded, so
  [`import_myriad_semi()`](https://kjhealy.github.io/myriad/reference/import_myriad_semi.md)
  and
  [`import_myriad_condensed()`](https://kjhealy.github.io/myriad/reference/import_myriad_condensed.md)
  no longer need to be called first. These functions now find Myriad Pro
  among the fonts installed on the system if it has not been copied into
  the package with
  [`copy_myriad_fonts()`](https://kjhealy.github.io/myriad/reference/copy_myriad_fonts.md),
  and register the families with both systemfonts and sysfonts, so they
  also work when showtext is active.

- [`theme_myriad_semi()`](https://kjhealy.github.io/myriad/reference/theme_myriad_semi.md)
  and
  [`theme_socviz_semi()`](https://kjhealy.github.io/myriad/reference/theme_socviz_semi.md)
  now check for the fonts named in `base_family` and `header_family`,
  rather than for their default fonts. Fonts registered with
  [`systemfonts::register_font()`](https://systemfonts.r-lib.org/reference/register_font.html),
  including by
  [`import_myriad_semi()`](https://kjhealy.github.io/myriad/reference/import_myriad_semi.md),
  now pass this check.

- [`import_myriad_semi()`](https://kjhealy.github.io/myriad/reference/import_myriad_semi.md)
  also registers a “Myriad Pro Semibold SemiCondensed” family, the
  default `header_family` for
  [`theme_myriad_semi()`](https://kjhealy.github.io/myriad/reference/theme_myriad_semi.md).
  The italic and bold italic faces of “Myriad Pro SemiCondensed” now
  point to the SemiCondensed italic files.

- [`theme_myriad_semi()`](https://kjhealy.github.io/myriad/reference/theme_myriad_semi.md),
  [`theme_myriad_map()`](https://kjhealy.github.io/myriad/reference/theme_myriad_map.md),
  and
  [`theme_myriad_nymap()`](https://kjhealy.github.io/myriad/reference/theme_myriad_nymap.md)
  are now built on the ggplot2 4.0.0 theme system, matching the
  `theme_socviz_*()` themes.
  [`theme_myriad_semi()`](https://kjhealy.github.io/myriad/reference/theme_myriad_semi.md)
  gains `ink`, `paper`, and `accent` arguments, sets geom defaults, and
  carries a discrete colour and fill palette. Its `title_family`
  argument is now `header_family`.
  [`theme_myriad_map()`](https://kjhealy.github.io/myriad/reference/theme_myriad_map.md)
  places the legend at the bottom.

- New
  [`theme_socviz_kjh()`](https://kjhealy.github.io/myriad/reference/theme_socviz_semi.md),
  [`theme_socviz_kjh_map()`](https://kjhealy.github.io/myriad/reference/theme_socviz_map.md),
  and
  [`theme_socviz_kjh_nymap()`](https://kjhealy.github.io/myriad/reference/theme_socviz_nymap.md)
  are aliases for
  [`theme_socviz_semi()`](https://kjhealy.github.io/myriad/reference/theme_socviz_semi.md),
  [`theme_socviz_map()`](https://kjhealy.github.io/myriad/reference/theme_socviz_map.md),
  and
  [`theme_socviz_nymap()`](https://kjhealy.github.io/myriad/reference/theme_socviz_nymap.md).

- [`theme_socviz_semi()`](https://kjhealy.github.io/myriad/reference/theme_socviz_semi.md),
  [`theme_socviz_map()`](https://kjhealy.github.io/myriad/reference/theme_socviz_map.md),
  and
  [`theme_socviz_nymap()`](https://kjhealy.github.io/myriad/reference/theme_socviz_nymap.md)
  are now built on the ggplot2 4.0.0 theme system.
  [`theme_socviz_semi()`](https://kjhealy.github.io/myriad/reference/theme_socviz_semi.md)
  defaults to Socviz Condensed for body text, gains `ink`, `paper`, and
  `accent` arguments, sets geom defaults, and carries a discrete colour
  and fill palette. Its `title_family` argument is now `header_family`.
  [`theme_socviz_map()`](https://kjhealy.github.io/myriad/reference/theme_socviz_map.md)
  places the legend at the bottom.
