#' Creates the directories for a typical EDA project
#'
#' Creates the directories for a typical EDA project
#' @param vignette a boolean variable indicating whether one folder should be named "vignette" rather than the default "analysis"
#' @keywords organization workflow eda
#' @export
#' @examples
#' create_project_directories()

create_project_directories <- function(vignette = FALSE, ...){
  # extract project name for labeling cloud directory
  project_name <- basename( rstudioapi::getActiveProject() )

  project_cloud_dir <- paste0("cloud_", project_name)

  # build directories
  eda_template <-
    c(project_cloud_dir, "munge", "analysis", "R",
      paste(project_cloud_dir, "reports", sep = "/"),
      paste(project_cloud_dir, "data", sep = "/"),
      paste(project_cloud_dir, "data", "raw", sep = "/")
    )

  purrr::walk(eda_template, dir.create)

  breadcrumbs::add_file_paths()
  file.create("README.md")
  breadcrumbs::add_gitignore()

  if (vignette == TRUE) {file.rename("analysis", "vignette")}
}
