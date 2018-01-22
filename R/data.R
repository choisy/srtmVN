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
#' plot(srtm90)
#' ## Extracting the elevation in one location:
#' ## raster::extract
"srtm90"
