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
wrapper for functions in the package `landscapeR`
`citep(citation("landscapeR"))`.

    land1 <- landgen(area = 10000, 
                     prop1 = 0.5, 
                     prop2 = 0.1, 
                     n1 = 25, 
                     n2 = 25)

    ## Warning in makePatch(context = mtx, spt = pts[np], size = size[np], bgr = bgr, : Patch size reached from seed point 3870 was 4 . No
    ## further background cells available for the patch.

    ## Warning in makePatch(context = mtx, spt = pts[np], size = size[np], bgr = bgr, : Patch size reached from seed point 1840 was 19 . No
    ## further background cells available for the patch.

## Installation

`devtools::install_github("sponslerdb/floralcurves")`

## References
