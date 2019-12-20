#' Converts log odds to probability value
#'
#' Converts log odds to probability value, which is useful for interpreting results of logistic regression.
#' @param log_odds is the predicted log odds for a sample
#' @keywords logistic regression
#' @export
#' @examples
#' log_odds_to_prob(3.56)

log_odds_to_prob <- function(log_odds) {
	exp(log_odds) / (1 + exp(log_odds))
}
