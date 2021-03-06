% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Titre.R
\name{titre}
\alias{titre}
\title{Calculates the titre value of ELISA}
\usage{
titre(cutoff, dilutions, OD, n)
}
\arguments{
\item{cutoff}{(numeric variable) this indicates the cutoff value of ELISA}

\item{dilutions}{(numeric variable)  different dilutions of serum or antigen}

\item{OD}{(numeric variable) this indicates the optical density}

\item{n}{(numeric variable) this refers to the number of times the dilutions are made. Generally, for ELISA it is 2 fold dilution (so n=2)}
}
\description{
Calculates the titre value of ELISA
}
\author{
Shantanu Tamuly (drsan100@gmail.com)
}
