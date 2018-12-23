#' Standardize CDEC header
#'
#' @param df
#'
#' @return
#'
#' @export
#'
#' @fromImport purrr set_names

apply_header_names <- function(df){
  header_names <- c('station', 'sensor_id', 'duration', 'sensor_num', 'sensor_type', 'date', 'obs_date', 'value', 'flag', 'units')

  df %>%
    purrr::set_names(header_names)

}
