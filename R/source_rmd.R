#' source() Rmd files
#'
#' This function would source() .Rmd files, which can be useful in makelikefiles
#' @keywords makelikefile here
#' @param rmd_file is a string indicating the file or file path
#' @export
#' @examples
#' source_rmd(here::here("munge", "100_init_munge.Rmd"))

source_rmd <- function(rmd_file){
  knitr::knit(rmd_file, output = tempfile())
}

# H/T https://stackoverflow.com/questions/10966109/how-to-source-r-markdown-file-like-sourcemyfile-r

