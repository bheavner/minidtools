% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R, R/getter-methods.R,
%   R/setter-methods.R
\docType{methods}
\name{locations}
\alias{locations}
\alias{locations,minid-method}
\alias{locations<-,minid-method}
\title{locations}
\usage{
locations(x)

\S4method{locations}{minid}(x)

\S4method{locations}{minid}(x) <- value
}
\arguments{
\item{x}{minid object}

\item{value}{the new locations list}
}
\value{
The minid locations (as list)
}
\description{
Get the minid locations
}
\section{Methods (by class)}{
\itemize{
\item \code{minid}: getter method for the locations slot

\item \code{minid}: setter method for the locations slot
}}

\examples{
\dontrun{
locations(minid_object)
}

}
