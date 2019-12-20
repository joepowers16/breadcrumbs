#' Formats p-values to APA standards
#'
#' SFormats p-values to APA standards
#' @param pval is a double representing the pvalue
#' @keywords p-valeus
#' @export
#' @examples
#' format_pval(.230456)

format_pval <- function(pval){
	dplyr::case_when(
		pval > .250 ~ "> .250",
		pval < .001 ~ "< .001",
		TRUE ~ paste0("= ", broman::myround(pval, 3))
	)
}
