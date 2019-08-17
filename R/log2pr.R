# convert log odds from glm model to probability
log2pr <- function(x){
  exp(x) / (1 + exp(x))
}