Rcppfor
=======

Sample R package - learn and demo how to access "modern" fortran from R, via Rcpp

# Purpose

This package is the result of a learning experience to explore how to interface R with Fortran(90 or more recent) code. While there is a way to access Fortran code (77 or more recent) from R using the standard R package build process, the manual "R Writing R extension" suggests there are known limitations in mixed language situations (C/C++/F[77|90|etc.]).

The most active area of development for R interop with native libraries is Rcpp. The premise of the present packages is that there is overall more value in taking advantage of Rcpp and the iso_c_binding Fortran-C interoperability module than using the existing R-Fortran interoperability API.

# Build instructions

checkout of install_github

# Use cases

* Basic scenario: 
** Hello world from Fortran: a fortran function or subroutine 'returns' a string
** C string to fortran, return to R as character vector
** Numeric array from fortran

* More complicated scenarios: 
** retrieved something with ryaml or rjson: what is it, and need to pass the information to the Fortran code.
** Fortran type wrapped by a C++ class. Surely there are examples out there to build upon.

# Technical overview

* R package Rcppfor ==> Rcpp glue ==> C code ==> Fortran iso_c based API ==> Fortran DLL (or static lib?)

# Creating a package that uses Rcpp

This is a log of what needed done to have a starting point for this package.

```S
setwd('c:/path/to/your/sandpit')
library(Rcpp)
library(devtools)
Rcpp.package.skeleton(name='Rcppfor', module=TRUE, attributes=TRUE, example_code = TRUE)
```

Modify the Makevars.win to add the -std:c++0x flag: see  http://lists.r-forge.r-project.org/pipermail/rcpp-devel/2012-July/004040.html

# Ideas

* Facilities to generate iso_c_bindings based API. Reusable stuff from f2py?
* 

# Log

2013-08-30 Well, the build process becomes difficult as soon as one deviates form the usual R package build with source code. I was trying to do all things with the RTools toolchain but it is unclear what is happening with gfortran. Googling opens Pandora's box of partial bits of information. A more pragmatic approach will be to use the Intel VF toolchain and build entirely from visual studio. It does take care of a lot of boilerplate compiler gunk that I find difficult to figure out how to do with gfortran.

