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
#' @examples
#' landtab(land1,
#'     comp0 = c("Cirsium vulgare", "Trifolium repens", "Taraxacum agg."),
#'     comp1 = c("Brassica napus"),
#'     comp2 = c("Acer pseudoplatanus", "Crataegus monogyna", "Salix cinerea"),
#'     prob0 = c(1, 1, 1),
#'     prob1 = c(1),
#'     prob2 = c(0.8, 0.15, 0.05),
#'     traitTab = baude_traits,
#'     plantNames = "name.latin")

landtab <- function(x, comp0, comp1, comp2,
                    prob0, prob1, prob2,
                    traitTab, plantNames) {

  x %>%

    as.data.frame(xy = TRUE) %>% # retain spatial data in case we want to transform back to raster
    rename(class = layer) %>%
    mutate(class = factor(class)) %>%

    mutate(plant = map(class, function(x) case_when(
      x == 0 ~ sample(comp0, size = 1, prob = prob0),
      x == 1 ~ sample(comp1, size = 1, prob = prob1),
      x == 2 ~ sample(comp2, size = 1, prob = prob2)
    ))) %>%
    mutate(plant = unlist(plant)) %>%
    mutate(index = row_number()) %>%
    dplyr::select(index, x, y, class, plant) %>%
    left_join(traitTab, by = c("plant" = plantNames))
}
