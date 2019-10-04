#' Source all files in a directory.
#'
#' Source all files in a directory.
#' @param dir a path to a directory
#' @keywords organization efficiency
#' @export
#' @examples
#' source_directory(here::here("R"))

source_directory <- function(dir){
	my_files <- list.files(dir, full.names = TRUE)
	my_files <- my_files[stringr::str_detect(my_files, ".R$")]
	purrr::walk(my_files, source)
}
