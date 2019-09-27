#' Sets breaks in ggplot axis without regard to min and max limits of that axis
#'
#' Sets breaks in ggplot axis without regard to min and max limits of that axis
#' @param .x the axis (usualy left blank in ggplot usage)
#' @param .step the interval step for your breaks
#' @keywords breaks ggplot
#' @export
#' @examples
#' ggplot(mtcars, aes(x=wt,y=mpg)) + geom_point() + scale_y_continuous(breaks = limitless_breaks)

limitless_breaks <- function(.x, .step = 1){
	seq(floor(min(.x)), ceiling(max(.x)), by = .step)
}

# h/t https://stackoverflow.com/questions/39040066/change-axis-breaks-without-defining-sequence-ggplot
