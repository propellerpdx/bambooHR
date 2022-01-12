#' @title Bamboo HR API get request wrapper
#'
#' @description  Submits get requests to the Bamboo API
#'
#' @param id employee ID. The special employee ID of zero (0) means to use the employee ID associated with the API key (if any).
#' @param fields  vector of values
#' @param verbose Logical scalar. Should the function provide verbose messaging back on each step?
#' @param ... tbd
#'
#' @return response object
#'
#' @author Mark Druffel, \email{mdruffel@propellerpdx.com}
#'
#' @export
get_employees <- function(id, fields, verbose, ...) {
  dots <- rlang::list2(...)
  api <- "employees"
  # Default to directory if an individual employee is not specified
  id <- rlang::maybe_missing(id, default = "directory")
  fields <- rlang::maybe_missing(fields, default = NULL)
  if (!rlang::is_null(fields) && id != "directory") {
    query <- list(fields = URLencode(paste(fields, collapse = ",")))
  } else {
    query <- NULL
  }
  url <- build_url(
    company_domain = dots$company_domain,
    api_version = dots$api_version,
    base_url = dots$base_url
  )
  url <- glue::glue("{url}/{api}/{id}")
  url <- httr::modify_url(url = url, query = query)
  response <- get_request(url)
  return(response)
}
