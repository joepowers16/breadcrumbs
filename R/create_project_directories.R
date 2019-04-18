#' Creates the directories for a typical EDA project
#'
#' Creates the directories for a typical EDA project
#' @keywords organization workflow eda
#' @export
#' @examples
#' create_project_directories()

create_project_directories <- function(){
  eda_template <- c("data", "data/raw", "munge", "analysis", "R")
  sapply(eda_template, dir.create)
  file.create("file_paths.R") # File to save file paths
}


