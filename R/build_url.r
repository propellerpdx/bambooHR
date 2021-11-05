#' @title Build URL Endpoints with Company Domain and API Version
#'
#' @description  fill in
#'
#' @param company_domain  tbd
#' @param api_version tbd
#' @param base_url tbd
#'
#' @return text
#'
#' @examples
#'
#'
#' @author Mark Druffel, \email{mdruffel@propellerpdx.com}

build_url <- function(company_domain, api_version, base_url){
  if(!rlang::is_null(base_url)){
    base_url <- base_url
  } else{
    base_url <- rlang::missing_arg()
  }
  if(!rlang::is_null(api_version)){
    api_version <- api_version
  } else{
    api_version <- rlang::missing_arg()
  }
  if(!rlang::is_null(company_domain)){
    company_domain <- company_domain
  } else{
    company_domain <- rlang::missing_arg()
  }
  base_url <- get_base_url(base_url)
  api_version <- get_api_version(api_version)
  company_domain <- get_company_domain(company_domain)
  url <- glue::glue("{base_url}/{company_domain}/{api_version}")
  return(url)
}

get_base_url <- function(base_url){
  base_url <- rlang::maybe_missing(base_url, default = "https://api.bamboohr.com/api/gateway.php")
  return(base_url)
}
get_api_version <- function(api_version){
  api_version <- rlang::maybe_missing(api_version, default = "v1")
  return(api_version)
}
get_company_domain <- function(company_domain){
  company_domain <- rlang::maybe_missing(company_domain, default = "propellerpdx")
  return(company_domain)
}
