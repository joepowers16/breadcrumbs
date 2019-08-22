#' Creates the standard set of subdirectories for a typical R project
#'
#' Creates the standard set of subdirectories for a typical R project
#' @param style string value indicating the style of subdirectories to create (c("default", "learning", "minimal"))
#' @param vignette a boolean value indicating whether "analysis" directory should be named "vignette"
#' @keywords organization workflow eda
#' @export
#' @examples
#' create_project_directories()

create_project_directories <- function(style = "default", license = "none", vignette = FALSE, add_makefile = TRUE, ...){
  # extract project name for labeling cloud directory
  project_name <- basename( rstudioapi::getActiveProject() )

  project_cloud_dir <- paste0("cloud_", project_name)

  # define directories
  default_template <-
    c(project_cloud_dir, "munge", "analysis", "R",
      fs::path(project_cloud_dir, "reports"),
      fs::path(project_cloud_dir, "data"),
      fs::path(project_cloud_dir, "data", "raw")
    )
  learning_template <-
    c(project_cloud_dir, "munge", "vignette", "R",
      fs::path("vignette", "daily_log"),
      fs::path("vignette", "exercises"),
      fs::path("vignette", "summaries"),
      fs::path(project_cloud_dir, "reports"),
      fs::path(project_cloud_dir, "data"),
      fs::path(project_cloud_dir, "data", "raw")
    )
  minimal_template <-
    c("munge", "analysis", "data", fs::path("data", "raw"))

  # populate project directory with files and subdirectories
  if (style == "default") {
    purrr::walk(default_template, dir.create)
    breadcrumbs::add_file_paths()
    breadcrumbs::add_readme(style = style)
    breadcrumbs::add_gitignore()
    file.create("README.md")
  }
  if (style == "learning") {
    purrr::walk(learning_template, dir.create)
    breadcrumbs::add_file_paths()
    breadcrumbs::add_readme(style = style)
    breadcrumbs::add_gitignore()
  }
  if (style == "minimal") {
    purrr::walk(minimal_template, dir.create)
    breadcrumbs::add_readme(style = style)
  }

  if (vignette == TRUE) {file.rename("analysis", "vignette")}

  if (license == "MIT") {usethis::use_mit_license()}

  if (add_makefile == TRUE) {breadcrumbs::add_makefile()}
}
