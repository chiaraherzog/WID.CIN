#' Basic index function
#'
#' @param beta Beta-valued matrix with rownames labeling CpGs and columns labeling samples for which an index is desired
#' @param w Coefficients/weights
#' @param scaling Scaling: this is data the index is centered around
#' @param name index name (optional)
#' @param invert Should index be inverted? This will depend on the index and how it was trained.
#' @return Scaled index
#' @export

computeIndex <- function(beta, w, scaling, name = "",
                         invert = T){

  # Check overlaps with coefficients
  intersect <- intersect(names(w), rownames(beta))

  # how many are present?
  present <- sum(names(w) %in% rownames(beta))
  percPresent <- (present/length(w))

  if(!identical(intersect, names(w))){
    cat("[", name, "] ", round(percPresent*100, 2), "% of CpGs present (", present, "/", length(w), ")\n", sep = "")
  }

  # Compute index - training version
  B <- beta[match(intersect, rownames(beta)),]
  w <- w[match(intersect, names(w))]
  B1 <- B*w
  index <- colSums(B1,na.rm=T)

  if(invert == T){
    index <- -(index - mean(scaling))/sd(scaling)
  } else {
    index <- (index - mean(scaling))/sd(scaling)
  }

  return(index)
}
