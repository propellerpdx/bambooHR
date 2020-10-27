#' @title Coerce input date parameters to ISO 8601 format for Bamboo HR REST API
#'
#' @examples
#' as_ISO8601_character("2020-09-01")
#' as_ISO8601_character("2020-09-01 00:00:00.001")
#'
#' @author Mark Druffel, \email{mdruffel@propellerpdx.com}


as_ISO8601_character <- function(time){
  if (! is.null(time)) {
    tm <- strftime(time, "%Y-%m-%dT%H:%M:%S")
    time_z <- strftime(time, "%z") # format +0200
    # Add : between hour and rest
    time_z_colon <- paste0(
      substring(time_z, 1, 3),
      ":",
      substring(time_z, 4, 5))

    paste0(tm, time_z_colon)
  } else {
    return(NULL)
  }
}



#is_ymd <- function(date = NULL) {
#  check <- grepl("^[1-9]{1}[0-9]{3}-[0-1]{1}[0-9]{1}-[0-3]{1}[0-9]{1}$",
#                 trimws(date))
#  return(check)
#}

#is_ymd_hms <- function(date = NULL){
#  check <- grepl("^[1-9]{1}[0-9]{3}-[0-1]{1}[0-9]{1}-[0-3]{1}[0-9]{1} [0-2]{1}[0-9]{1}:[0-5]{1}[0-9]{1}:[0-6]{1}[0-9]{1}$",
#                 trimws(date))
#  return(check)
#}

#is_ymd_hmsms <- function(date = NULL){
#  check <- grepl("^[1-9]{1}[0-9]{3}-[0-1]{1}[0-9]{1}-[0-3]{1}[0-9]{1} [0-2]{1}[0-9]{1}:[0-5]{1}[0-9]{1}:[0-6]{1}[0-9]{1}\\.[0-9]{1}[0-9]{1}[0-9]{1}$",
#                 trimws(date))
#  return(check)
#}

#coerce_ISO8601 <- function(date){
#  if(is_ymd(date)){
#    input_date <- lubridate::ymd_hms(paste0(date, " 00:00:00"))
#  }
#  if(is_ymd_hms(date)){
#    input_date <- lubridate::ymd_hms(date)
#  }
#  if(is_ymd_hmsms(date)){
#    input_date <- lubridate::ymd_hms(date)
#  }
#  iso_date <- paste0(lubridate::format_ISO8601(input_date),"Z")
#  return(iso_date)
#}
