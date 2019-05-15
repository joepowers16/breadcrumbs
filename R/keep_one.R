#' function to save ove row of data for each unique value of the ID variable
#'
#' function to save ove row of data for each unique value of the ID variable. Useful when you want to be sure that you have only one row per level of your ID.
#' @param data is the data
#' @param x is a variable, usually an ID
#' @param seed a seed for consistent randomization
#' @keywords EDA
#' @import dplyr
#' @export
#' @examples
#' mtcars %>% keep_one(cyl)

keep_one <- function(data, x, seed = 57){
  set.seed(seed)
  x <- dplyr::enquo(x)
  data %>%
    dplyr::group_by(!!x) %>%
    dplyr::sample_n(1) %>%
    dplyr::ungroup()
}
