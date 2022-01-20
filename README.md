
# bambooHR <a href='https://dplyr.tidyverse.org'><img src='images/hex.png' align="right" height="139" /></a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/MangoTheCat/bambooHR/workflows/R-CMD-check/badge.svg)](https://github.com/MangoTheCat/bambooHR/actions)
<!-- badges: end -->

`{bambooHR}` is an R wrapper for the bambooHR API. By supplying a
company domain and an API access token, users can seamlessly make API
requests through built-in R functions.

## Installing and Loading {bambooHR}

To install the latest release from CRAN, run:

``` r
install.packages("bambooHR")
```

Alternatively to install latest version on GitHub, run:

``` r
remotes::install_github("https://github.com/MangoTheCat/bambooHR")
```

Finally, load the package:

``` r
library(bambooHR)
```

## Authentication

In order to obtain an API key, you will need to login to bambooHR via an
account with administrative privileges. Hit the user icon in the
top-right and select ‘API Keys’. Next, enter a name for the API key in
the API Key Name field and click Generate Key. Copy the key to
clipboard.

Now run the `config_setup()` function, supplying your API key and the
company domain, plus an optional filepath for where to store the config
file.

``` r
config_setup(apikey = "API_KEY_12345", 
             companyname = "Ascent", 
             conffile = "./bbhr_config.json")
```

The package functions will now pull in your configuration information
automatically.

``` r
get_employees()
```
