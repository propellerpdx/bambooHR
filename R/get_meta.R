#' @title Bamboo API get request wrapper for BambooHR tables
#'
#' @description  Submits a get request to retrieve a specified table from the system, valid tables are retreived from the
#' meta data API
#'
#' @param data fields, tables, lists, users, time_off/types, time_off/policies
#' @param ... tbd
#'
#' @return tbl_df
#'
#' @examples
#'
#' keys <- globalEntry::get_keys()
#' job_info <- get_table(table = "jobInfo")
#' job_info_changes <- get_table(table = "jobInfo", since = lubridate::today()-1)
#'
#' @references \url{https://documentation.bamboohr.com/reference#get-employee-table-row-1}
#'
#' @importFrom magrittr %>%
#'
#' @export
#'

get_meta <- function(data, ...){
  dots <- rlang::list2(...)
  url <- build_url(company_domain = dots$company_domain,
                   api_version = dots$api_version,
                   base_url = dots$base_url)
  url <- glue::glue("{url}/meta/{data}")
  response <- get_request(url)
}
