<!-- badges: start -->

[![R-CMD-check](https://github.com/sponslerdb/floralcurves/workflows/R-CMD-check/badge.svg)](https://github.com/sponslerdb/floralcurves/actions)
<!-- badges: end -->

## Overview

`floralcurves` is a package for analyzing and visualizing
landscape-scale floral resource dynamics.

![Alt
text](https://github.com/sponslerdb/floralcurves/blob/main/inst/extdata/model_schematic.png?raw=true "Title")

## Setup

## 1. Generate landscape

Landscape are generated with the function `landgen()`, which serves as a
wrapper for functions in the package `landscapeR` (Masante 2017).

    land1 <- landgen(area = 10000, 
                     prop1 = 0.5, 
                     prop2 = 0.1, 
                     n1 = 25, 
                     n2 = 25)

## Installation

`devtools::install_github("sponslerdb/floralcurves")`

## References

Masante, Dario. 2017. *landscapeR: Categorical Landscape Simulation
Facility*. <https://CRAN.R-project.org/package=landscapeR>.
