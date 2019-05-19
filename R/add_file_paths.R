#' adds a standardized file_paths.R project root directory
#'
#' This function adds a standardized file_paths.R project root directory
#' @keywords file_paths.R
#' @export
#' @examples
#' add_file_paths()

add_file_paths <- function(dir_R = here::here()){

  project_name <- project_name <- basename( rstudioapi::getActiveProject() )

  file_names_template <-
    glue::glue('
dir_proj <- here::here()
dir_cloud <- here::here("cloud_{project_name}")
dir_reports <- fs::path(dir_cloud, "reports")
')
    writeLines(file_names_template, fs::path(dir_R, "file_paths.R"))
  }
