#' Extend a floral landscape over a time series, apply a phenology function
#' to each floral species, and generate a vector of sugar availability through
#' time.
#'
#' @param x the data frame output of \code{landtab}
#' @param first start of time series, by default 0 (= Jan 1)
#' @param last end of time series, by default 365 (= Dec 31)
#' @return A data frame including a vector of sugar availability
#' @export

landpheno <- function(x, first = 0, last = 364) {

  time <- seq(first:last)

  x %>%
    tidyr::crossing(time) %>%
    dplyr::mutate(date = lubridate::as_date(time),
                  month = lubridate::month(date)) %>%

    # Calculate triangular density function
    dplyr::mutate(phenology = purrr::pmap(list(time, bloom.start, bloom.end,
                                               bloom.peak), pheno)) %>%

    # Unlist the result' not sure why it produces a list
    dplyr::mutate(phenology = unlist(phenology)) %>%

    # Normalize density function so that max density = 1
    dplyr::mutate(phenology = dplyr::if_else(phenology > 0,
                                             phenology/max(phenology),
                                             phenology)) %>%

    # Multiply peak density by normalized phenology
    dplyr::mutate(flower.density = flower.density.peak * phenology) %>%

    # Multiple sugar.per.flower by flower.density, divide by 1e6 to convert
    # from micrograms to grams sugar
    dplyr::mutate(sugar = (sugar.per.flower*flower.density)/1000000)
}
