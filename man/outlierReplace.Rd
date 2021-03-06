% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/replace_outlier.R
\name{outlierReplace}
\alias{outlierReplace}
\title{Replace outliers in a dataset}
\usage{
outlierReplace(dataframe, cols, rows, newValue = NA)
}
\arguments{
\item{dataframe}{an object of class data.frame}

\item{cols}{specify columns}

\item{rows}{specify rows}

\item{newValue}{specify a new value to replace outliers with such as the mean of the column}
}
\value{
a data.frame is returned
}
\description{
Replace outliers in a dataset
}
\details{
\url{http://sel-columbia.github.io/formhub.R/demo/RemoveOutliers.html}
}
