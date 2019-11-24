#' converts decimal doubles (e.g., 0.98) to character values with percent symbol
#'
#' converts decimal doubles (e.g., 0.98) to character values with percent symbol
#' @param x is a vector of decimal values
#' @param digits is the number of digits to display in the output
#' @keywords percent
#' @export
#' @examples
#' percentize(c(0.98, 0.50, 0.879))

percentize <- function(x, digits = 0){
	# increase digits by 2 because multiplying by 100 will remove two decimal places
	digits <- digits + 2
	x <- round(x, digits = digits)
	x <- x * 100
	paste0(x, "%")
}
