#' Creates the directories for a typical EDA project
#'
#' Creates the directories for a typical EDA project
#' @param project_name a string representing the name of the Rproject
#' @keywords organization workflow eda
#' @export
#' @examples
#' create_project_directories()

create_project_directories <- function(project_name){
  project_name_data <- paste0("data/", project_name, "_cloud_data")

  # build directories
  eda_template <- c(
      "data", project_name_data, paste(project_name_data, "raw", sep = "/"),
      "munge", "analysis", "R"
  )

  sapply(eda_template, dir.create)

  file.create("file_paths.R") # File in which to save file paths
}


