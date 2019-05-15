#' return the mode from a vector
#'
#' return the mode from a vector
#' @param x is a vector
#' @param na.rm a logical value indicating whether to consider NAs as potential modal value.
#' @keywords mode
#' @export
#' @examples
#' Mode(mtcars$am)

Mode <- function(x, na.rm = FALSE) {
  if (na.rm == TRUE) {
    x <- x[!is.na(x)]
  }

  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

# H/T Ken Williams https://stackoverflow.com/questions/2547402/is-there-a-built-in-function-for-finding-the-mode
