#' saves ggplot plots with attractive defaults
#'
#' saves ggplot plots with attractive defaults
#' @param plot_object is a ggplot object
#' @param file_name is the name you want your plot image saved as
#' @param color of file name that will appear in caption (default is "lightgray")
#' @param face font face of caption with file name (default is "italic")
#' @param size font size of caption with file name (default is 3)
#' @param ... additional arguments for ggsave such as height, width, units, etc.
#' @keywords organization efficiency
#' @export
#' @examples
#' my_ggsave(p, "myplot.png")

my_ggsave <- function(plot_object, file_name, color = "lightgray", face = "italic", size = 3, ...){
  plot_object +
    ggplot2::labs(caption = file_name) +
    ggplot2::theme(
      plot.caption = element_text(color = color, face = face, size = size)
    )

  ggsave(file_name, ...)
}
