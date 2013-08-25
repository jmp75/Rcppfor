Rcppfor
=======

Sample R package - learn and demo how to access "modern" fortran from R, via Rcpp


# Creating a package that uses Rcpp

```S
setwd('c:/path/to/your/sandpit')
library(Rcpp)
library(devtools)
Rcpp.package.skeleton(name='Rcppfor', module=TRUE, attributes=TRUE, example_code = TRUE)
```

Modify the Makevars.win to add the -std:c++0x flag: see  http://lists.r-forge.r-project.org/pipermail/rcpp-devel/2012-July/004040.html

Basic scenario: 
Hello world from Fortran
Numeric array from fortran
C string to fortran, return to R as character vector


More complicated scenarios: 
retrieved something with ryaml or rjson: what is it, and need to pass the information to the Fortran code.
Fortran type wrapped by a C++ class. Surely there are examples out there to guild upon.

