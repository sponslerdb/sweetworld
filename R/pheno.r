#' Model floral phenology as a triangular function of first bloom, last bloom,
#' and peak bloom; called internally by \code{landpheno}.
#'
#' @param x a vector of time steps
#' @param start time step of first bloom
#' @param end time step of last bloom
#' @param peak time step of peak bloom
#' @return a vector of proportional floral density
#' @export

pheno <- function(x, start, end, peak) {
  triangle::dtriangle(x, start, end, peak)
}
