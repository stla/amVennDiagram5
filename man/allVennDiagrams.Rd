% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/enumeration.R
\name{allVennDiagrams}
\alias{allVennDiagrams}
\title{Enumeration of Venn diagrams}
\usage{
allVennDiagrams(cardinalities, output = "dataframes")
}
\arguments{
\item{cardinalities}{vector of positive integers}

\item{output}{either \code{"lists"} or \code{"dataframes"}}
}
\value{
List of Venn diagrams.
}
\description{
Given the cardinalities of some sets, returns all possible
  Venn diagrams of these sets.
}
