
[![Build Status](https://travis-ci.org/kjhealy/socviz.svg?branch=master)](https://travis-ci.org/kjhealy/myriad) 

# myriad

## About

Adapts the Roboto themes in https://github.com/hrbrmstr/hrbrthemes/ to make two Myriad Pro-based themes, `theme_myriad()` and `theme_myriad_semi()` for ggplot. Note that this repo does not include the Myriad font files (the `.otf` files), which are owned by Adobe. You may already have them installed on your computer, or they may have come bundled with your copy of Acrobat Reader or other Adobe software.


## Usage

```r

library(myriad)
import_myriad_semi()

theme_set(theme_myriad_semi())

```


