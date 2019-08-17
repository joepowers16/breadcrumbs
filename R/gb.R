#' Returns size of object in gigabytes
#'
#' Returns size of object in gigabytes
#' @param x is a data object
#' @keywords organization efficiency
#' @export
#' @examples
#' gb(mtcars)

gb <- function(x) {
  format(object.size(x), units = "GB", standard = "legacy")
}
