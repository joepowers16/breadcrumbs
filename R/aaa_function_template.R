#' Say what this function does in one line
#'
#' Say what this function does in greater detail if that helps.
#' @param data is the data
#' @param x is a variable representing something
#' @keywords organization efficiency
#' @export
#' @examples
#' aaa_function_template(mtcars, x = mpg)

aaa_function_template <- function(data, x){
  x <- enquo(x)
  data %>% pull(!!x) %>% mean()
}
