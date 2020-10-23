#' @title Bamboo API get request wrapper for BambooHR tables
#'
#' @description  Submits a get request to retrieve a specified table from the system, valid tables are retreived from the
#' meta data API
#'
#' @param user Bamboo api user id, register in Bamboo "API Keys"
#' @param password Bamboo login password
#' @param verbose a logical; indicates if detailed output from httr calls should be provided; default FALSE
#' @param table_alias the a alis of the table name requested, must be valid from the meta data API
#' @return tbl_df
#'
#' @examples
#'
#' user <- 'your_api_user'
#' password <- 'your_password'
#' verbose <- 'your_preference'
#' table_alias <- 'table_alias'
#' table_data <- get_table(table_alias=table_alias, user=user, password=password, verbose=verbose)
#'
#' @references \url{https://documentation.bamboohr.com/reference#get-employee-table-row-1}
#'
#' @importFrom magrittr %>%
#'
#' @export
get_table <- function(table, id = 'all', ...){
  file_id <- rlang::maybe_missing(file_id, default = "view")
  url <- build_url(company_domain = dots$company_domain,
                   api_version = dots$api_version,
                   base_url = dots$base_url)
  url <- glue::glue("{url}/files/{file_id}")
  response <- get_request(url)
}
