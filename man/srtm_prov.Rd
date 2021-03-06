% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{srtm_prov}
\alias{srtm_prov}
\title{SRTM averages by province}
\format{An object of class \code{data.frame} with 63 rows and 3 columns.}
\usage{
srtm_prov
}
\description{
Average elevations by province, weighted or not by local population density.
}
\details{
Local population density data are coming from the WorldPop project.
}
\examples{
\dontrun{
# loading the data:
library(srtmVN)
data(srtm_prov)

# comparing the 2 measures of aggregated elevation:
plot(elevation1 ~ elevation2, srtm_prov, xlab = "weighted by population density", ylab = "non weighted")
abline(0, 1)

# mapping the 2 measures:
library(sf)
provinces <- gadmVN::gadm()
provinces <- merge(provinces, srtm_prov)
plot(provinces[c("elevation1", "elevation2")])

# mapping the differences between the 2 measures:
provinces$elevation_diff <- with(srtm_prov, elevation1 - elevation2)
plot(provinces["elevation_diff"])
}

}
\author{
Marc Choisy
}
\keyword{datasets}
