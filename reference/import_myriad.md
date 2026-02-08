# Import all Myriad Pro font faces and styles for use in graphs as "Myriad Pro".

This will work for devices that use \`systemfonts\` to process fonts.
For PDFs, use showtext::showtext_auto() beforehand

## Usage

``` r
import_myriad(font_family = "Myriad Pro", silent = TRUE)
```

## Arguments

- font_family:

  The font family you want to import

- silent:

  Report on what's been imported or not

## Note

Modified from
https://yjunechoe.github.io/posts/2021-06-24-setting-up-and-debugging-custom-fonts/.
