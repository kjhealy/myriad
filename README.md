
# myriad

## About

Myriad Pro-based themes for ggplot, `theme_myriad()` and `theme_myriad_semi()`. Various hacks / workaround functions to try to have both a systemfonts/ragg pipeline for pngs and a showtext one for pdf devices.

Note that this repo does not include the Myriad font files (the `.otf` files), which are owned by Adobe. You may already have them installed on your computer, or they may have come bundled with your copy of Acrobat Reader or other Adobe software.


## Usage

```r

library(myriad)
import_myriad_semi()

theme_set(theme_myriad_semi())

```


