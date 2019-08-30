#' This function adds a template Makefile to your prject's root directory
#'
#' This function adds a template Makefile to your prject's root directory
#' @keywords makefile make
#' @export
#' @examples
#' add_makefile()

add_makefile <- function(path = here::here()){
	file.copy(
		from = system.file("resources/file_templates/Makefile", package = "breadcrumbs"),
		to = path
	)
}
