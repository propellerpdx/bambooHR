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
#' @references \url{https://documentation.bamboohr.com/reference#get-employee-table-row-1}
#'
#' @export
get_meta <- function(data){
  url <- build_url()
  url <- glue::glue("{url}/meta/{data}")
  response <- get_request(url)
}
