#' @title Bamboo HR API get request wrapper
#'
#' @description  Submits get requests to the Bamboo API
#'
#' @param url Character url of the get request.
#' @param key  Character key. Register in your account, see \href{https://documentation.bamboohr.com/docs#section-authentication}{authentication} for details.
#' @param verbose Logical scalar. Should the function provide verbose messaging back on each step?
#'
#' @return response object
#'
#' @author Mark Druffel, \email{mdruffel@propellerpdx.com}
#' @references
#' \url{https://github.com/r-lib/httr}
#' \url{https://curl.haxx.se/libcurl/c/CURLOPT_HTTP_VERSION.html}

get_request <- function(url = "https://api.bamboohr.com/api/gateway.php/propellerpdx/v1/employees/all/tables/compensation",
                        key = keys$BAMBOO_KEY,
                        verbose){
  verbose <- rlang::maybe_missing(verbose, FALSE)
  # Confirm internet works --------------------------------------------------
  check_internet()

  # Password is any random string -------------------------------------------
  # The password for bamboo api should be any random string and user should be the API key, see https://documentation.bamboohr.com/docs#section-authentication
  response <- httr::GET(url, httr::authenticate(user = key, password = 'notapplicable'),
                        httr::add_headers(Accept = "application/json"),
                        if(verbose == T){
                          httr::verbose(data_out = T, info = T)
                        } else{
                          NULL
                        })
  check_status(response)
  return(response)
}

check_internet <- function(){
  if(curl::has_internet() == FALSE){
    stop("Please check your internet connection.")
  }
}

check_status <- function(response){
  if(httr::http_error(response)){
    stop(httr::message_for_status(response))
  }
}

