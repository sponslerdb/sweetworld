## code to prepare `DATASET` dataset goes here
baude_traits <- readr::read_csv("./inst/extdata/baude_ST11.csv") %>%
  dplyr::mutate(bloom.start = lubridate::yday(lubridate::mdy(bloom.start)),
                bloom.end = lubridate::yday(lubridate::mdy(bloom.end)),
                bloom.peak = lubridate::yday(lubridate::mdy(bloom.peak))) %>%
  dplyr::select(-flower.density.mean) %>%
  dplyr::filter(!is.na(flower.density.peak)) %>%
  dplyr::filter(!is.na(nectar.per.flower)) %>%

  # Add a class with zero floral resources; this can represent impervious surface, water, turfgrass, etc.
  tibble::add_row(name.latin = "null", name.common = "null", family = "null",
                  breeding.system = "null", life.span = "null", dicliny = "null",
                  height = "null", bloom.start = 1, bloom.end = 365, bloom.peak = 180,
                  bloom.days = 365, flower.density.peak = 0, nectar.per.flower = 0)


usethis::use_data(DATASET, overwrite = TRUE)
