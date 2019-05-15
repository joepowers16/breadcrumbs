#' This function generates an R file with a roxygen2-friendly template
#'
#' This function generates an R file with a roxygen2-friendly template that will enable all metadata about your function to be read into the package documentation when you build your package
#' @param function_name is the name of the function you are creating
#' @param dir_R is the directory in which you want tosave the output R file
#' @keywords function template
#' @export
#' @examples
#' function_template("my_function")

function_template <-
  function(function_name = "my_function_template", dir_R = here::here("R")){
    text_function_template <- "#' Say what this function does in one line
#'
#' Say what this function does in greater detail if that helps.
#' @param data is the data
#' @param x is a variable representing something
#' @keywords organization efficiency
#' @export
#' @examples
#' my_function_template(mtcars, x = mpg)

my_function_template <- function(data, x){
  x <- enquo(x)
  data %>% pull(!!x) %>% mean()
}"

    text_function_template <-
      stringr::str_replace_all(
        text_function_template, "my_function_template", function_name
      )

    file_name <- paste0(function_name, ".R")

    writeLines(text_function_template, fs::path(dir_R, file_name))
  }
