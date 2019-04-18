#' Function to convert dataframe names to lowercase without white space or punctuation besides underscores.
#'
#' Function to convert dataframe names to lowercase without white space or punctuation besides underscores.
#' @param data your tibble or dataframe
#' @keywords clean names
#' @export
#' @examples
#' mydata <- clean_names(mydata)

clean_names <- function(data){
  names(data) <- clean_strings(names(data))
  return(data)
}
