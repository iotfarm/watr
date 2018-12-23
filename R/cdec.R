#' Extract CDEC Data
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
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr mutate_all
#' @importFrom dplyr tbl_df

#' @examples
#' cdec('SHA', '15', 'D', '2018-01-01', '2018-02-01')

cdec<- function(station,
                sensor,
                duration,
                start_date = today() - 7,
                end_date = today() - 1,
                ...){

  #  Build the URL
  url <- url_builder(station, sensor, duration, start_date, end_date)

  #  Sleep momentarily so we don't hammer the server.
  Sys.sleep(0.3)

  #  GET data and return data frame
  df <- fromJSON(url) %>%
    apply_header_names %>%
    dplyr::mutate_all(as.character) %>%
    dplyr::tbl_df()

  return(df)
}
