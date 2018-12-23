#' Build URL for CDEC
#'
#' @param station
#' @param sensor
#' @param duration
#' @param start_date
#' @param end_date
#' @param ...
#'
#' @return
#' @export
#'
#' @fromImport httr parse_url
#' @fromImport httr build_url
#' @fromImport stringr str_c
#'
#' @examples
#' url_builder('SHA', '15', 'D', '2018-01-01', '2018-02-01')
url_builder <- function(station,
                        sensor,
                        duration,
                        start_date,
                        end_date,
                        ...){
  #  Base URL
  url <- httr::parse_url("http://cdec.water.ca.gov/dynamicapp/req/JSONDataServlet")

  #  Add query agruments
  url$query <- list(Stations = stringr::str_c(station, collapse = ','),
                    SensorNums = stringr::str_c(sensor, collapse = ','),
                    dur_code = stringr::str_c(duration, collapse = ','),
                    Start = start_date,
                    End = end_date)
  #  Endpoint
  url <- httr::build_url(url)

  #  Print the assembled url to the screen
  print(url)

  #  Return the url
  return(url)
}

#url <- 'https://cdec.water.ca.gov/dynamicapp/req/JSONDataServlet?Stations=DTO&SensorNums=23&dur_code=D&Start=2018-06-13&End=2018-09-13'

