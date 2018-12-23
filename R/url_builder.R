url_builder <- function(station,
                        sensor,
                        duration,
                        start_date,
                        end_date,
                        ...){
  #  Base URL
  url <- httr::parse_url("http://cdec.water.ca.gov/dynamicapp/req/JSONDataServlet")

  #  Add query agruments
  url$query <- list(Stations = str_c(station, collapse = ','),
                    SensorNums = str_c(sensor, collapse = ','),
                    dur_code = str_c(duration, collapse = ','),
                    Start = start_date,
                    End = end_date)
  #  Endpoint
  url <- httr::build_url(url)
  print(url)
}

#url <- 'https://cdec.water.ca.gov/dynamicapp/req/JSONDataServlet?Stations=DTO&SensorNums=23&dur_code=D&Start=2018-06-13&End=2018-09-13'

