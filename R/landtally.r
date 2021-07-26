#' Sum up nectar availability by various criteria (e.g. morphology, patch class,
#' floral taxon).
#'
#' @param x the data frame output of \code{landpheno}
#' @param criterion a categorical variable in the input data frame \code{x}
#'     by which nectar availability will be parsed
#' @return A data frame of summed nectar availability
#' @examples
#' landtally(x, flower.shape)


landtally <- function (x, criterion = NULL) {

  criterion <- enquo(criterion)

  x %>%
    group_by(time, !!criterion) %>%
    summarize(total.nectar = sum(nectar)) %>%
    mutate(date = as_date(time))
}
