#' wrapper function to enable glimpse() of data.tables.
#'
#' wrapper function to enable glimpse() of data.tables.
#' @param data_table a data.table
#' @keywords organization efficiency
#' @export
#' @examples
#' glimpse_dt(data_table)

glimpse_dt <- function(data_table){
  dplyr::glimpse(tibble::as_tibble(data_table))
}
