# myriad 0.10.0

* myriad now registers the Myriad Pro SemiCondensed and Condensed families when it is loaded, so `import_myriad_semi()` and `import_myriad_condensed()` no longer need to be called first. These functions now find Myriad Pro among the fonts installed on the system if it has not been copied into the package with `copy_myriad_fonts()`, and register the families with both systemfonts and sysfonts, so they also work when showtext is active.

* `theme_myriad_semi()` and `theme_socviz_semi()` now check for the fonts named in `base_family` and `header_family`, rather than for their default fonts. Fonts registered with `systemfonts::register_font()`, including by `import_myriad_semi()`, now pass this check.

* `import_myriad_semi()` also registers a "Myriad Pro Semibold SemiCondensed" family, the default `header_family` for `theme_myriad_semi()`. The italic and bold italic faces of "Myriad Pro SemiCondensed" now point to the SemiCondensed italic files.

* `theme_myriad_semi()`, `theme_myriad_map()`, and `theme_myriad_nymap()` are now built on the ggplot2 4.0.0 theme system, matching the `theme_socviz_*()` themes. `theme_myriad_semi()` gains `ink`, `paper`, and `accent` arguments, sets geom defaults, and carries a discrete colour and fill palette. Its `title_family` argument is now `header_family`. `theme_myriad_map()` places the legend at the bottom.

* New `theme_socviz_kjh()`, `theme_socviz_kjh_map()`, and `theme_socviz_kjh_nymap()` are aliases for `theme_socviz_semi()`, `theme_socviz_map()`, and `theme_socviz_nymap()`.

* `theme_socviz_semi()`, `theme_socviz_map()`, and `theme_socviz_nymap()` are now built on the ggplot2 4.0.0 theme system. `theme_socviz_semi()` defaults to Socviz Condensed for body text, gains `ink`, `paper`, and `accent` arguments, sets geom defaults, and carries a discrete colour and fill palette. Its `title_family` argument is now `header_family`. `theme_socviz_map()` places the legend at the bottom.
