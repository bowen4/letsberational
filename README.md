# letsberational

Functions for finding the implied Black-Scholes (lognormal) and 
Bachelier (normal) volatilities of a financial option. This package uses the
techniques described by Peter Jäckel and his reference C++ implementations,
which are fast and highly accurate. This package additionally includes
forward functions that compute option prices from the volatilities.

References:
Jäckel (2015) <doi:10.1002/wilm.10395>.  
Jäckel (2017) <doi:10.1002/wilm.10581>.

## Installation

You can install the development version of letsberational from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("bowen4/letsberational")
```
