# myriad 0.10.0

* `theme_myriad_semi()`, `theme_myriad_map()`, and `theme_myriad_nymap()` are now built on the ggplot2 4.0.0 theme system, matching the `theme_socviz_*()` themes. `theme_myriad_semi()` gains `ink`, `paper`, and `accent` arguments, sets geom defaults, and carries a discrete colour and fill palette. Its `title_family` argument is now `header_family`. `theme_myriad_map()` places the legend at the bottom.

* New `theme_socviz_kjh()`, `theme_socviz_kjh_map()`, and `theme_socviz_kjh_nymap()` are aliases for `theme_socviz_semi()`, `theme_socviz_map()`, and `theme_socviz_nymap()`.

* `theme_socviz_semi()`, `theme_socviz_map()`, and `theme_socviz_nymap()` are now built on the ggplot2 4.0.0 theme system. `theme_socviz_semi()` defaults to Socviz Condensed for body text, gains `ink`, `paper`, and `accent` arguments, sets geom defaults, and carries a discrete colour and fill palette. Its `title_family` argument is now `header_family`. `theme_socviz_map()` places the legend at the bottom.
