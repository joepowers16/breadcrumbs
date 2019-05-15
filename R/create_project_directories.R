#' Creates the directories for a typical EDA project
#'
#' Creates the directories for a typical EDA project
#' @param project_name a string representing the name of the Rproject
#' @keywords organization workflow eda
#' @export
#' @examples
#' create_project_directories()

create_project_directories <- function(){
  # extract project name for labeling cloud directory
  project_name <- basename(rstudioapi::getActiveProject() )

  project_cloud_dir <- paste0("cloud_", project_name)

  # build directories
  eda_template <-
    c(project_cloud_dir, "munge", "analysis", "R",
      paste(project_cloud_dir, "reports", sep = "/"),
      paste(project_cloud_dir, "data", sep = "/"),
      paste(project_cloud_dir, "data", "raw", sep = "/")
    )

  purrr::walk(eda_template, dir.create)

  file.create("file_paths.R") # File in which to save file paths
  file.create("README.md") # File in which to save file paths
  breadcrumbs::add_gitignore()
}
