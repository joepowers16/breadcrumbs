#' function to source file paths script
#'
#' function to source file paths script where I save all my file paths.
#' @param file_paths is an Rscript of files paths
#' @keywords file paths
#' @export
#' @examples
#' source_file_paths()

source_file_paths <- function(file_paths = here::here("file_paths.R")){
  source(file_paths)
}
