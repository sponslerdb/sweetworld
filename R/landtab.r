#' Tabulate a simulated landscape, populate patch classes with plants, and
#' add floral data from a trait table.
#'
#' @param x the raster output of \code{landgen}
#' @param comp0 a vector of plant names, corresponding to names in the floral
#' trait table, that will make up patch class 0; can be length 1 for
#' monospecific class
#' @param comp1 a vector of plant names, corresponding to names in the floral
#' trait table, that will make up patch class 1; can be length 1 for
#' monospecific class
#' @param comp2 a vector of plant names, corresponding to names in the floral
#' trait table, that will make up patch class 2; can be length 1 for
#' monospecific class
#' @param prob0 a vector of weights for each plant in comp0, controlling the
#' relative abundance of each plant within class0; same length as comp0
#' @param prob1 a vector of weights for each plant in comp1, controlling the
#' relative abundance of each plant within class1; same length as comp1
#' @param prob2 a vector of weights for each plant in comp2, controlling the
#' relative abundance of each plant within class2; same length as comp2
#' @param traitTab a table of floral taxa and traits; must at minimum contain
#' (1) plant name, (2) peak floral density, (3) first bloom, (4) peak bloom,
#' (5) last bloom, and (6) nectar per flower; ideally also contains relevant
#' functional traits in the form of categorical variables.
#' @param plantNames the name of the column in the trait table that contains the
#' plant names
#' @return A data frame
#' @export

landtab <- function(x, comp0, comp1, comp2,
                    prob0, prob1, prob2,
                    traitTab, plantNames) {

  x %>%

    raster::as.data.frame(xy = TRUE) %>% # retain spatial data in case we want to transform back to raster
    dplyr::rename(class = layer) %>%
    dplyr::mutate(class = factor(class)) %>%
    dplyr::mutate(plant = purrr::map(class, function(x) dplyr::case_when(
      x == 0 ~ sample(comp0, size = 1, prob = prob0),
      x == 1 ~ sample(comp1, size = 1, prob = prob1),
      x == 2 ~ sample(comp2, size = 1, prob = prob2)
    ))) %>%
    dplyr::mutate(plant = unlist(plant),
                  index = dplyr::row_number()) %>%
    dplyr::select(index, x, y, class, plant) %>%
    dplyr::left_join(traitTab, by = c("plant" = plantNames))
}
