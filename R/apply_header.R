#' Standardize CDEC header
#'
#' @param df A data frame returned by cdec.R
#'
#' @return
#'
#' @export
#'
#' @fromImport purrr set_names
#' @fromImport dplyr %>%

apply_header_names <- function(df){
  header_names <- c('station', 'sensor_id', 'duration', 'sensor_num', 'sensor_type', 'date', 'obs_date', 'value', 'flag', 'units')

  df %>%
    purrr::set_names(header_names)

}
