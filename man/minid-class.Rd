% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllClasses.R
\docType{class}
\name{minid-class}
\alias{minid-class}
\title{minid-class}
\description{
An S4 class to represent a minid.
}
\section{Slots}{

\describe{
\item{\code{identifier}}{a character string containing the minid
(e.g. ark:/99999/fk4mp58v5t)}

\item{\code{short_identifier}}{a character string containing the short form minid
(e.g. minid:fk4mp58v5t)}

\item{\code{creator}}{a character string giving the name of the person who
registered the minid (e.g. "mdarcy")}

\item{\code{orcid}}{a character string giving the ORCID of the person who registered
the minid}

\item{\code{created}}{a character string giving the date and time the minid was
created (e.g. "Mon, 19 Mar 2018 17:43:57 GMT")}

\item{\code{checksum}}{the checksum of the identified digital object (e.g.
"6484968f81afac84857d02b573b0d589fb2f9582a2b920572830dc5781e0a53c")}

\item{\code{checksum_function}}{the hashing function used to calculate the checksum
(e.g. "SHA")}

\item{\code{status}}{The minid status (e.g. "ACTIVE" or "MOTHBALLED")}

\item{\code{locations}}{A list of locations hostingthe identified digital object
(e.g. "mdarcy - https://nih-commons.s3.amazonaws.com/misc/agr-example.tgz")}

\item{\code{titles}}{A list of titles for the identified digital object (e.g.
"mdarcy - AGR Data set with identifier-based references to data in cloud
storage"}

\item{\code{obsoleted_by}}{For minids that have "MOTHBALLED" status, a list of minids
superceding the mothballed minid}

\item{\code{content_key}}{a character string used for the hash of a bdbag}
}}

\section{see also}{

\code{?\link{minid}}
}

