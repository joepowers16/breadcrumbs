#' adds a standardized README file to project root directory
#'
#' This function adds a standardized README to project root directory.
#' @param learning a boolean to indicate if the README should describe the use of the vignette subdirectories
#' @keywords README
#' @export
#' @examples
#' add_readme()

add_readme <- function(style, dir_proj = here::here()){
  if (style == "learning") {
    readme_text <- "
This project uses a directory format that organizes my learning progress in a way
that focusses my time investments and increases the retrievability of my code
and insights.

I have organized the vignette into three folders that reflect my workflow:
In my `daily_log/` I store my efforts in chronological order, just as if they
were being recorded in a paper notebook. The `summaries/` directory will
contain polished summaries and syntheses of my daily efforts. `Exercises/`
includes just that.
"
  }
  if (style %in% c("default", "minimal")) {
  readme_text <- "
Project Name:
Author:
Date:
Project Overview:
"}

  if (style %in% c("learning", "default")) {
    writeLines(readme_text, fs::path(dir_proj, "README.md"))
  }
  if (style == "minimal") {
    writeLines(readme_text, fs::path(dir_proj, "README.txt"))
  }
}
