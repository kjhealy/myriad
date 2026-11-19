# Import Myriad SemiCondensed only

Registers the SemiCondensed faces of Myriad Pro under their own family
names. Each face is taken from the package's \`fonts/myriad-pro\`
directory if present there, and otherwise from the fonts installed on
the system. This will work for devices that use \`systemfonts\` to
process fonts. For PDFs, use showtext::showtext_auto() beforehand

## Usage

``` r
import_myriad_semi()
```

## Value

Makes "Myriad Pro SemiCondensed" and "Myriad Pro Semibold SemiCondensed"
available for use

## Examples

``` r
if (FALSE) { # \dontrun{
} # }
```
