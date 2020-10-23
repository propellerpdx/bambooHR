#' @title Bamboo HR API get request wrapper
#'
#' @description  Submits get requests to the Bamboo API
#'
#' @param id employee ID. The special employee ID of zero (0) means to use the employee ID associated with the API key (if any).
#' @param file_id  vector of values
#' @param verbose Logical scalar. Should the function provide verbose messaging back on each step?
#'
#' @return response object
#'
#' @examples
#' keys <- globalEntry::get_keys()
#' response <- get_employees(id = 0, fields = c("firstName","lastName"))
#'
#' @author Mark Druffel, \email{mdruffel@propellerpdx.com}


get_employee_file <- function(id, file_id, ...){
  dots <- rlang::list2(...)
  #Default to view if a file_id is not specified, this provides all files the employee has
  file_id <- rlang::maybe_missing(file_id, default = "view")
  url <- build_url(company_domain = dots$company_domain,
                   api_version = dots$api_version,
                   base_url = dots$base_url)
  url <- glue::glue("{url}/employees/{id}/files/{file_id}")
  response <- get_request(url)
  return(response)
}
