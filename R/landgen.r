#' Simulate a landscape consisting of 2 patch classes (1, 2) superimposed on
#' a matrix (0). The area remaining as "matrix" (class 0) will naturally be
#' \code{area} - \code{prop1 x area + prop2 x area}. Patch number (n1, n2)
#' controls the granularity of the landscape. Note, though, that patches can
#' become contiguous, so there may not be n discrete patches in the output.
#'
#' @param area the area of the simulated landscape in m2. By default, it is set
#' to 10,000 (100 x 100) to simulate a 1 hectare landscape at a resolution of
#' 1 x 1 m.
#' @param prop1 proportion of total landscape covered by patch class 1
#' @param prop2 proportion of total landscape covered by patch class 2
#' @param n1 number of class1 patches
#' @param n2 number of class2 patches
#' @return A raster
#' @examples
#' landgen(10000, prop1 = 0.5, prop2 = 0.25, n1 = 10, n2 = 5)

landgen <- function(area = 10000, prop1, prop2, n1, n2) {

  # Create matrix of zeros
  m = matrix(0, sqrt(area), sqrt(area))

  # Convert to raster
  r = raster::raster(m, xmn = 0, xmx = sqrt(area), ymn = 0, ymx = sqrt(area))

  land <- r %>%
    landscapeR::makeClass(n1, (prop1*area)/n1, val = 1) %>%
    landscapeR::makeClass(n2, (prop2*area)/n2, val = 2)
}
