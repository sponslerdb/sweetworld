#' Floral traits
#'
#' A dataset containing floral traits for 162 plant species. Data were curated
#' from Supplementary Table 11 of Baude et al. (2016) Nature 530:85-88. Species
#' lacking the full complement of traits required for our model were omitted,
#' and a new "species" called "null" was added to represent landscape patches
#' without floral resources.
#'
#' @format A data frame with 163 rows and 14 variables:
#' \describe{
#'   \item{name.latin}{Latin plant name}
#'   \item{name.common}{common plant name}
#'   \item{family}{botanical family}
#'   \item{flower.shape}{description of flower shape}
#'   \item{breeding.system}{description of plant breeding system}
#'   \item{life.span}{life span class of plant, e.g. annual, perennial}
#'   \item{dicliny}{dicliny of plant, e.g. monoecious, dioecious}
#'   \item{height}{height class of plant}
#'   \item{bloom.start}{start of bloom, day of year}
#'   \item{bloom.end}{end of bloom, day of year}
#'   \item{bloom.peak}{peak bloom, day of year}
#'   \item{flower.density.peak}{flowers per square meter at peak bloom}
#'   \item{nectar.per.flower}{micrograms of suger per flower per day}
#'   ...
#' }
#' @source \url{https://doi.org/10.1038/nature16532}
"baude_traits"
