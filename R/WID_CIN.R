#' WID_CIN index
#'
#' THE WID_CIN function uses a methylation beta matrix and returns the WID-CIN-index.
#' Authors: Barrett J., Herzog C. et al., 2021
#'
#' @param beta Methylation beta matrix object (Illumina Methylation EPIC; or 450K array)
#' @return Returns a list with CIN index (training and discovery version, and island versus open sea CpGs)
#' @export

WID_CIN <- function(beta){

  # Discovery version
  WID_CIN <- computeIndex(beta,
                          w = coefCIN,
                          scaling = scalingCIN,
                          name = "WID-CIN")

  #------------------------------------------#
  return(WID_CIN)

}
