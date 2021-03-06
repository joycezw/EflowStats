% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/monthlyMeanTs.R
\name{monthlyMeanTs}
\alias{monthlyMeanTs}
\title{Function to return the monthly mean time series for a given daily data series}
\usage{
monthlyMeanTs(qfiletempf)
}
\arguments{
\item{qfiletempf}{data frame containing daily value data}
}
\value{
meanmonts data frame containing mean monthly values
}
\description{
This function accepts a data frame containing daily data and returns a data frame containing mean monthly data
}
\examples{
qfiletempf<-sampleData
monthlyMeanTs(qfiletempf)
}

