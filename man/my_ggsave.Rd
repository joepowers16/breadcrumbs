% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/my_ggsave.R
\name{my_ggsave}
\alias{my_ggsave}
\title{saves ggplot plots with attractive defaults}
\usage{
my_ggsave(
  plot_object,
  file_name,
  color = "lightgray",
  face = "italic",
  size = 3,
  ...
)
}
\arguments{
\item{plot_object}{is a ggplot object}

\item{file_name}{is the name you want your plot image saved as}

\item{color}{of file name that will appear in caption (default is "lightgray")}

\item{face}{font face of caption with file name (default is "italic")}

\item{size}{font size of caption with file name (default is 3)}

\item{...}{additional arguments for ggsave such as height, width, units, etc.}
}
\description{
saves ggplot plots with attractive defaults
}
\examples{
my_ggsave(p, "myplot.png")
}
\keyword{efficiency}
\keyword{organization}
