#' Sum up sugar availability by various criteria (e.g. morphology, patch class,
#' floral taxon).
#'
#' @param x the data frame output of \code{landpheno}
#' @param criterion a categorical variable in the input data frame \code{x}
#'     by which sugar availability will be parsed
#' @return A data frame of summed sugar availability
#' @export


landtally <- function (x, criterion = NULL) {

  criterion <- rlang::enquo(criterion)

  x %>%
    dplyr::group_by(time, !!criterion) %>%
    dplyr::summarize(total.sugar = sum(sugar)) %>%
    dplyr::mutate(date = lubridate::as_date(time))
}
