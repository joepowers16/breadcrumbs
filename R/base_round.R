#' A function to round values to any base
#'
#' This function will round values to any base (e.g., 25 or .25)
#' @param x is the vector you will be rounding
#' @param base is the value you will be rounding to (e.g., 25 or .25)
#' @keywords base round
#' @export
#' @examples
#' base_round( c(23.67, 2.7, 52.9, 7.7, 99.4), base = .25 )
#' base_round( c(23.67, 2.7, 52.9, 7.7, 99.4), base = 25 )

base_round <- function(x, base){
  (x / base) %>% round() * base
}

# H/T Erich Neuwirth
