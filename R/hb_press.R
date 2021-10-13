#' Model floral phenology as a triangular function of first bloom, last bloom,
#' and peak bloom; called internally by \code{landpheno}.
#'
#' @param x a vector of time steps
#' @param base population during off-season
#' @param start time step of start of population increase
#' @param end time step of end of population decrease
#' @param peak time step of peak population
#' @return a vector of forager population
#' @export

hb_press <- function(first = 0, last = 364, base = 10000, max = 30000,
                     start, end, peak, hives) {

  x <- seq(first:last) %>%
    tibble::as_tibble() %>%
    dplyr::select(time = 1) %>%
    dplyr::mutate(
      date = lubridate::as_date(time),
      base.prop = rep(base, n()),
      triangle = triangle::dtriangle(time, start, end, peak),
      triangle.norm = dplyr::if_else(triangle > 0,
                                     triangle/max(triangle),
                                     triangle),
      hb.pop = if_else(
        triangle.norm > 0,
        (base + ((max - base)*triangle.norm))*hives,
        base*hives)
      )
}
