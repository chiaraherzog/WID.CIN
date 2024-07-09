
# WID.CIN

<!-- badges: start -->
<!-- badges: end -->

The WID.CIN package computes the WID-CIN index on preprocessed DNA methylation data. The WID-CIN index is described in:

> ``[The WID-CIN test identifies women with, and at risk of, cervical intraepithelial neoplasia grade 3 and invasive cervical cancer](https://doi.org/10.1186/s13073-022-01116-9)''

Barrett J\*, Sundström K\*, Jones A\*, et al., *Genome Medicine* 2022 (https://doi.org/10.1186/s13073-022-01116-9).

## Installation

You can install the development version of WID.CIN as follows:

``` r
if(!require("devtools")){
  install.packages("devtools")
}

devtools::install_github("chiaraherzog/WID.CIN")
```

## Example usage

The WID_CIN can be easily applied to a beta matrix, where columns represent individuals and rows represent features (CpGs). 

``` r
library(WID.CIN)
index <- WID_CIN(beta)
```

The output is a named vector that can be matched, for instance, to your pheno file.

