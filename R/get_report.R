#' @title Bamboo HR API get request wrapper
#'
#' @description  Submits get requests to the Bamboo API
#'
#' @param id employee ID. The special employee ID of zero (0) means to use the employee ID associated with the API key (if any).
#' @param fields  vector of values
#' @param verbose Logical scalar. Should the function provide verbose messaging back on each step?
#'
#' @return response object
#'
#' @examples
#' keys <- globalEntry::get_keys()
#' response <- get_employees(id = 0, fields = c("firstName","lastName"))
#'
#' @author Mark Druffel, \email{mdruffel@propellerpdx.com}

get_report <- function(id, format, fd, ...){
  dots <- rlang::list2(...)
  #Default to csv format is not specified - csv seems most likely
  format <- rlang::maybe_missing(format, default = "csv")
  fd <- rlang::maybe_missing(fd, default = "yes")
  query <- list(format = format, fd = fd)
  url <- build_url(company_domain = dots$company_domain,
                   api_version = dots$api_version,
                   base_url = dots$base_url)
  url <- glue::glue("{url}/reports/{id}")
  url <- httr::modify_url(url = url, query = query)
  response <- get_request(url)
  return(response)
}
