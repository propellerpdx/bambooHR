#' @title Build URL Endpoints with Company Domain and API Version
#'
#' @description  Creates the base URL to send API requests
#'
#' @param company_domain  The subdomain used to access BambooHR. If you access BambooHR at https://mycompany.bamboohr.com, then the companyDomain is "mycompany"
#' @param api_version Version of the API to consume. Default is "v1"
#' @param base_url Base URL that all API requests made must begin with. Default is "https://api.bamboohr.com/api/gateway.php"
#'
#' @return text
#'
#' @examples
build_url <- function(company_domain = Sys.getenv(COMPANY_DOMAIN),
                      api_version = "v1",
                      base_url = "https://api.bamboohr.com/api/gateway.php") {
  if (missing(company_domain)) {
    stop("Please run `Sys.setenv(COMPANY_DOMAIN = <your company name>)` to use the build_url function with default arguments")
  }

  stopifnot(
    is.character(company_domain),
    is.character(api_version),
    is.character(base_url)
  )

  url <- glue::glue("{base_url}/{company_domain}/{api_version}")
  return(url)
}
