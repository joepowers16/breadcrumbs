#' A wrapper version of tidyr::separate() that automatically creates and names correct number of new variables
#'
#' A wrapper version of tidyr::separate() that automatically creates and names correct number of new variables
#' @param data is the data
#' @param x is a variable being separated
#' @param sep is the separator character
#' @param prefix prefix used in names of variables created by separation
#' @param fill default argument passed to tidyr::separate()
#' @param extra default argument passed to tidyr::separate()
#' @keywords separate
#' @export
#' @examples
#' mtcars %>% rownames_to_column("model") %>% separate_n(x = model, sep = " ")

separate_n <- function(data, x, sep, fill = "right", extra = "warn"){
  name <- deparse(substitute(x))
  x <- dplyr::enquo(x)

  # Create one more new var names than there are seperators
  N_NEW_VARS <-
    data %>%
    dplyr::transmute(n_seps = stringr::str_count(!!x, sep)) %>%
    dplyr::pull(n_seps) %>%
    max(na.rm=TRUE) + 1

  v_names_funding <- paste(name, seq(1:N_NEW_VARS), sep = "_")

  data %>%
    tidyr::separate(
      !!x,
      sep = sep,
      into = v_names_funding,
      extra = extra,
      fill = fill
    )
}
