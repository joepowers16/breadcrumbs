#' Creates the standard set of subdirectories for a typical R project
#'
#' Creates the standard set of subdirectories for a typical R project
#' @param subproject string indicating the name of the new subproject directory
#' @keywords organization workflow eda
#' @export
#' @examples
#' create_subproject("my_great_hypothesis")

create_subproject <- function(subproject, add_makefile = TRUE, ...){
  if(missing(subproject)) {
    stop("Please provide a subproject name, e.g., create_subproject('my_subproject')")
  }

  dir_subproject <- fs::path('analysis', subproject)

  # define directories
  sub_project_template <-
    fs::path(
      dir_subproject,
      c("munge", "analysis", "data")
    )

  # populate project directory with files and subdirectories
  dir.create(dir_subproject)
  purrr::walk(sub_project_template, dir.create)
  file.create(fs::path(dir_subproject, "README.md"))

  if (add_makefile == TRUE) {
    file.copy(
      from = system.file(
        "resources/file_templates/subproject.makefile",
        package = "breadcrumbs"),
      to = fs::path(dir_subproject, paste0(subproject, ".makefile"))
    )
  }

  # append file_paths.R with new subproject directory
  new_file_path <- paste0("dir_", subproject, " <- fs::path(dir_analysis, '", subproject, "')")
  write(new_file_path, file = here::here("file_paths.R"), append=TRUE)
}
