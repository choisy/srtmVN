#' SRTM90 elevation data for Vietnam
#'
#' The SRTM90 Digital Elevation Model from CGIAR.
#'
#' \code{srtm90} is a RasterLayer object that contains the elevation data for
#' Vietnam from the SRTM90.
#'
#' @source SRTM90 data base from \url{http://srtm.csi.cgiar.org}.
#' @author Marc Choisy
#' @examples
#' ## Plotting the elevations of Vietnam:
#' \dontrun{
#' plot(srtm90)
#' }
#' ## Extracting the elevation in one location:
#' ## raster::extract
"srtm90"

#' SRTM averages by province
#'
#' Average elevations by province, weighted or not by local population density.
#'
#' Local population density data are coming from the WorldPop project.
#'
#' @author Marc Choisy
#' @examples
#' \dontrun{
#' # loading the data:
#' library(srtmVN)
#' data(srtm_prov)
#'
#' # comparing the 2 measures of aggregated elevation:
#' plot(elevation1 ~ elevation2, srtm_prov, xlab = "weighted by population density", ylab = "non weighted")
#' abline(0, 1)
#'
#' # mapping the 2 measures:
#' library(sf)
#' provinces <- gadmVN::gadm()
#' provinces <- merge(provinces, srtm_prov)
#' plot(provinces[c("elevation1", "elevation2")])
#'
#' # mapping the differences between the 2 measures:
#' provinces$elevation_diff <- with(srtm_prov, elevation1 - elevation2)
#' plot(provinces["elevation_diff"])
#' }
#'
"srtm_prov"
