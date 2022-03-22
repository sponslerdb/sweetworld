## code to prepare `DATASET` dataset goes here
baude_supp <- readr::read_csv("./inst/extdata/baude_ST11.csv") %>%
  dplyr::mutate(bloom.start = lubridate::yday(lubridate::mdy(bloom.start)),
                bloom.end = lubridate::yday(lubridate::mdy(bloom.end)),
                bloom.peak = lubridate::yday(lubridate::mdy(bloom.peak))) %>%
  dplyr::select(-flower.density.mean) %>%
  dplyr::filter(!is.na(flower.density.peak)) %>%
  dplyr::filter(!is.na(sugar.per.flower)) %>%

  # Add a class with zero floral resources; this can represent impervious surface, water, turfgrass, etc.
  tibble::add_row(name.latin = "null", name.common = "null", family = "null",
                  breeding.system = "null", life.span = "null", dicliny = "null",
                  height = "null", bloom.start = 1, bloom.end = 365, bloom.peak = 180,
                  bloom.days = 365, flower.density.peak = 0, sugar.per.flower = 0)

ktype <- readr::read_csv("./inst/extdata/baude_ktypes.csv")

baude_traits <- dplyr::left_join(baude_supp, ktype) %>%
  dplyr::mutate(k.type.s = stringr::str_extract(ktype, "[-+]?[0-9]*\\.?[0-9]+"), # make simplified (and more simplified) k types
         k.type.ss = stringr::str_extract(ktype, "[-+]?[0-9]*"))

usethis::use_data(baude_traits, overwrite = TRUE)

