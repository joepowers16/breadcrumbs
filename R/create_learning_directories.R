#' Creates the directories for a typical learning project
#'
#' Creates the directories for a typical learning project
#' @keywords organization workflow learning
#' @export
#' @examples
#' create_learning_directories()

create_learning_directories <- function(...){
  # extract project name for labeling cloud directory
  project_name <- basename( rstudioapi::getActiveProject() )

  project_cloud_dir <- paste0("cloud_", project_name)

  # build directories
  eda_template <-
    c(project_cloud_dir, "munge", "vignette", "R",
      fs::path("vignette", "daily_log"),
      fs::path("vignette", "exercises"),
      fs::path("vignette", "summaries"),
      fs::path(project_cloud_dir, "reports"),
      fs::path(project_cloud_dir, "data"),
      fs::path(project_cloud_dir, "data", "raw")
    )

  purrr::walk(eda_template, dir.create)

  breadcrumbs::add_file_paths()
  breadcrumbs::add_readme(learning = TRUE)
  breadcrumbs::add_gitignore()
}
