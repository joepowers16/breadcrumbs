#' Function to convert astring such as the names of a dataset to lowercase without white space or punctuation besides underscores.
#'
#' Function to convert astring such as the names of a dataset to lowercase without white space or punctuation besides underscores.
#' @param x are a string such as the names of a dataset
#' @keywords clean_strings
#' @export
#' @examples
#' clean_strings("Get RID - of loosE---stuff")

clean_strings <- function(x){
  x %>%
    stringr::str_to_lower() %>%
    stringr::str_replace_all(c("\\s+"="_", "[[:punct:]]"="_")) %>%
    stringr::str_replace_all("_+", "_") %>%
    stringr::str_remove_all("^_") %>%
    stringr::str_remove_all("_$")
}
