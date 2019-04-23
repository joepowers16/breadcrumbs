#' Creates the directories for a typical EDA project
#'
#' Creates the directories for a typical EDA project
#' @param project_name a string representing the name of the Rproject
#' @keywords organization workflow eda
#' @export
#' @examples
#' create_project_directories()

create_project_directories <- function(project_name){
  project_cloud_dir <- paste0(project_name, "_cloud_dir")

  # build directories
  eda_template <-
    c(project_cloud_dir, "munge", "analysis", "R",
      paste(project_cloud_dir, "reports", sep = "/"),
      paste(project_cloud_dir, "data", sep = "/"),
      paste(project_cloud_dir, "data", "raw", sep = "/")
    )

  # sapply(eda_template, dir.create)
  purrr::walk(eda_template, dir.create)

  file.create("file_paths.R") # File in which to save file paths
  file.create("README.txt") # File in which to save file paths
}
