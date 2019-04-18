#' inserts line breaks into a string value after number of characters in `width`
#'
#' inserts line breaks into a string value after number of characters in `width`. This is useful in ensuring that ggplot titles do not run off the panel.
#' @param x a string value
#' @keywords ggplot wrap title
#' @export
#' @examples
#' wrap("This is a really long title of a plot that I want to nicely wrap and fit onto the plot without having to manually add the backslash n, but at the moment it does not", width = 20)

wrap <- function(x, width = 20) {
  paste(strwrap(x, width), collapse = "\n")
}
