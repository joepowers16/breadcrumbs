#' adds a standardized gitignore file to project root directory
#'
#' This function adds a standardized gitignore file to project root directory
#' @keywords gitignore
#' @export
#' @examples
#' add_gitignore()

add_gitignore <- function(path = here::here()){
	file.copy(
		from = system.file("resources/file_templates/.gitignore", package = "breadcrumbs"),
		to = path)
}
