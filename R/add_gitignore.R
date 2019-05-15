#' adds a standardized gitignore file to project root directory
#'
#' This function adds a standardized gitignore file to project root directory
#' @keywords gitignore
#' @export
#' @examples
#' add_gitignore()

add_gitignore <- function(dir_R = here::here()){
    text_function_template <- "# History files
.Rhistory
.Rapp.history
.DS_Store

# Session Data files
.RData

# Example code in package build process
*-Ex.R

# Output files from R CMD build
/*.tar.gz

# Output files from R CMD check
/*.Rcheck/

# RStudio files
.Rproj.user/

# produced vignettes
vignettes/*.html
vignettes/*.pdf

# OAuth2 token, see https://github.com/hadley/httr/releases/tag/v0.3
.httr-oauth

# knitr and R markdown default cache directories
/*_cache/
/cache/

# Temporary files created by R markdown
*.utf8.md
*.knit.md

# Shiny token, see https://shiny.rstudio.com/articles/shinyapps.html
rsconnect/
.Rproj.user

# large data files
cloud_*/
"
    writeLines(text_function_template, fs::path(dir_R, ".gitignore"))
  }
