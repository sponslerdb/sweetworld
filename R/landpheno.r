#' Extend a floral landscape over a time series, apply a phenology function
#' to each floral species, and generate a vector of nectar availability through
#' time.
#'
#' @param x the data frame output of \code{landtab}
#' @param first start of time series, by default 0 (= Jan 1)
#' @param last end of time series, by default 365 (= Dec 31)
#' @return A data frame including a vector of nectar availability
#' @examples
#' landtally(x, first = 40, last = 300)

landpheno <- function(x, first = 0, last = 365) {

  time <- seq(first:last)

  x %>%
    crossing(time) %>%

    # Calculate triangular density function
    mutate(phenology = pmap(list(time, bloom.start, bloom.end, bloom.peak), pheno_func)) %>%

    # Unlist the result' not sure why it produces a list
    mutate(phenology = unlist(phenology)) %>%

    # Normalize density function so that max density = 1
    mutate(phenology = if_else(phenology > 0, phenology/max(phenology), phenology)) %>%

    # Multiply peak density by normalized phenology
    mutate(flower.density = flower.density.peak * phenology) %>%

    # Multiple nectar.per.flower by flower.density
    mutate(nectar = nectar.per.flower*flower.density)
}
