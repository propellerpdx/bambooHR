get_company_file <- function(file_id, ...){
  dots <- rlang::list2(...)
  #Default to directory if an individual employee is not specified
  file_id <- rlang::maybe_missing(file_id, default = "view")
  url <- build_url(company_domain = dots$company_domain,
                   api_version = dots$api_version,
                   base_url = dots$base_url)
  url <- glue::glue("{url}/files/{file_id}")
  response <- get_request(url)
  return(response)
}

