#' This function adds a template Makefile to your prject's root directory
#'
#' This function adds a template Makefile to your prject's root directory
#' @keywords makefile make
#' @export
#' @examples
#' add_makefile()

add_makefile <- function(makefile_type = "project", path = here::here()){
		if(file.exists(fs::path(path, "Makefile"))) {
			stop("A Makefile already exists in the directory where you are trying to add a Makefile. Please rename existing Makefile to avoid a conflict (e.g., 'old.makefile'). Then re-execute add_makefile()")
		}

		if(makefile_type == "project") {
		file.copy(
			from = system.file(
				"resources/file_templates/Makefile",
				package = "breadcrumbs"),
			to = path
		)
	}

		if(makefile_type == "master") {
		file.copy(
			from = system.file(
				"resources/file_templates/master.makefile",
				package = "breadcrumbs"),
			to = fs::path(path, "Makefile")
		)
	}

	# Rename subproject makefile template after moving
	if(makefile_type == "subproject") {
		file.copy(
			from = system.file(
				"resources/file_templates/subproject.makefile",
				package = "breadcrumbs"),
			to = fs::path(path, paste0(subproject, ".makefile"))
		)
	}
}
