#' @title fill in
#'
#' @description  fill in
#'
#' @param table_name tbd
#' @param company_domain  tbd
#' @param employee_id tbd
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








  # # Employees ---------------------------------------------------------------
  # if(endpoint == "get_employee"){
  #   url <- httr::modify_url(url = glue::glue(
  #     "{base_url}/{company_domain}/{version}/employees/{id}", query = query))
  # } else if(endpoint == "get_employee_directory"){
  #   url <- httr::modify_url(url = glue::glue(
  #     "{base_url}/{company_domain}/{version}/employees/directory"))
  #   # Employee Files ----------------------------------------------------------
  # } else if("list_employee_files_and_categories"){
  #   url <- httr::modify_url(url = glue::glue(
  #     "{base_url}/{company_domain}/{version}/employees/{id}/files/view"))
  # } else if(endpoint == "get_employee_file"){
  #   url <- httr::modify_url(url = glue::glue(
  #     "{base_url}/{company_domain}/{version}/employees/{id}/files/{file_id}"))
  #   # Company Files -----------------------------------------------------------
  # } else if(endpoint == "list_company_files_and_categories"){
  #   url <- httr::modify_url(url = glue::glue(
  #     "{base_url}/{company_domain}/{version}/files/view"))
  # } else if(endpoint == "get_company_file"){
  #   url <- httr::modify_url(url = glue::glue(
  #     "{base_url}/{company_domain}/{version}/files/{file_id}"))
  # } else if(endpoint == "get_report"){
  #   url <- httr::modify_url(url = glue::glue(
  #     "{base_url}/{company_domain}/{version}/files/{file_id}"))
  #   # Reports -----------------------------------------------------------------
  # } else if(endpoint == "get_company_file"){
  #   url <- httr::modify_url(url = glue::glue(
  #     "{base_url}/{company_domain}/{version}/reports/{id}"), query = query)
  #   # Tabular Data ------------------------------------------------------------
  # } else if(endpoint == "get_employee_table"){
  #   url <- httr::modify_url(url = glue::glue(
  #     "{base_url}/{company_domain}/{version}/employees/{id}/tables/{table}"))
  # } else if(endpoint == "get_employee_table_changed"){
  #   url <- httr::modify_url(url = glue::glue(
  #     "{base_url}/{company_domain}/{version}/employees/changed/tables/{table}"), query = query)
  #   # Account Information -----------------------------------------------------
  # } else if(endpoint == "list_fields"){
  #   url <- httr::modify_url(url = glue::glue(
  #     "{base_url}/{company_domain}/{version}/meta/fields"))
  # } else if(endpoint == "list_tables_with_fields"){
  #   url <- httr::modify_url(url = glue::glue(
  #     "{base_url}/{company_domain}/{version}/meta/tables"))
  # } else if(endpoint == "list_field_details"){
  #   url <- httr::modify_url(url = glue::glue(
  #     "{base_url}/{company_domain}/{version}/meta/lists"))
  # } else if(endpoint == "list_users"){
  #   url <- httr::modify_url(url = glue::glue(
  #     "{base_url}/{company_domain}/{version}/meta/users"))
  #   # Time Off ----------------------------------------------------------------
  # } else if(endpoint == "list_time_off_types"){
  #   url <- httr::modify_url(url = glue::glue(
  #     "{base_url}/{company_domain}/{version}/meta/time_off/types"), query = query)
  # } else if(endpoint == "list_time_off_policies"){
  #   url <- httr::modify_url(url = glue::glue(
  #     "{base_url}/{company_domain}/{version}/meta/time_off/policies"))
  # } else if(endpoint == "get_time_off_requests"){
  #   url <- httr::modify_url(url = glue::glue(
  #     "{base_url}/{company_domain}/{version}/meta/time_off/requests/", query = query))
  # } else if(endpoint == "list_time_off_policies_for_employee"){
  #   url <- httr::modify_url(url = glue::glue(
  #     "{base_url}/{company_domain}/{version}/employees/{employee_id}/time_off/policies"))
  # } else if(endpoint == "estimate_time_off_balances"){
  #   url <- httr::modify_url(url = glue::glue(
  #     "{base_url}/{company_domain}/{version}/employees/{employee_id}/time_off/calculator", query = query))
  # } else if(endpoint == "get_out_of_office_employees"){
  #   url <- httr::modify_url(url = glue::glue(
  #     "{base_url}/{company_domain}/{version}/employees/{employee_id}/time_off/whos_out", query = query))
  #   # Photos ------------------------------------------------------------------
  # } else if(endpoint == "get_employee_photo"){
  #   url <- httr::modify_url(url = glue::glue(
  #     "{base_url}/{company_domain}/{version}/employees/{id}/photo/{size}"))
  # }
  # # Last Change Info --------------------------------------------------------
  # else if(endpoint == "get_employee_photo"){
  #   url <- httr::modify_url(url = glue::glue(
  #     "{base_url}/{company_domain}/{version}/v1/employees/changed", query = query))
  # } else{
  #   stop("The enpoint you are attempting to reach is not currently supported. Please contact the package maintainer if you have quesitons.")
  # }
