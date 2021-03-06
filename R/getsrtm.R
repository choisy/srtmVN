#' Gets the SRTM90 for Vietnam.
#'
#' \code{getsrtm} returns a RasterLayer object that points to a GeoTIFF file on disk containing the SRTM90 for Vietnam.
#'
#' @source The CGIAR consortium (\url{http://srtm.csi.cgiar.org}).
#' @examples
#' library(raster)
#' library(sp)
#' # getting the data:
#' srtm <- getsrtm()
#' srtm
#' filename(srtm)
#' projection(srtm)
#'
#' # Ploting the elevation of Vietnam
#' plot(srtm)
#'
#' # Ploting the elevation of Vietnam without legend and without axes:
#' plot(srtm, axes = FALSE, legend = FALSE)
#'
#' # Plotting first the administrative limits of the country and then the elevations:
#' library(sf)
#' plot(st_geometry(gadmVN::gadm(level = "country")))
#' plot(srtm, axes = FALSE, legend = FALSE, add = TRUE)
#'
#' # Cropping elevation inside one polygon:
#' hanoi <- subset(gadmVN::gadm(resolution = "high"), province == "Ha Noi")
#' hanoi_ele <- crop(srtm, hanoi)
#' plot(hanoi_ele)
#' plot(st_geometry(hanoi), add = TRUE)
#'
#' # Removing anything that outside the polygon:
#' themask <- rasterize(hanoi, hanoi_ele)
#' hanoi_ele <- mask(hanoi_ele, themask)
#' plot(hanoi_ele)
#' plot(st_geometry(hanoi), add = TRUE)
#'
#' # Extracting the elevation in 1 point:
#' extract(srtm, matrix(c(105, 21), 1))
#'
#' # Extracting the elevations inside the province of Hanoi:
#' hanoi <- subset(gadmVN::gadm(resolution = "high"), province == "Ha Noi")
#' elevations <- extract(srtm, hanoi)
#' avg_ele_hanoi <- mean(unlist(elevations))
#'
#' # Extracting the elevations in a buffer of 30 km of radius around Da Lat:
#' ele_dalat <- extract(srtm, matrix(c(108.459636, 11.938812), 1),
#'                      buffer = 30000)
#' mean(unlist(ele_dalat))
#'
#' @importFrom utils data installed.packages download.file
#'
#' @export
getsrtm <- function() {
  if (!file.exists(paste0(installed.packages()["srtmVN", "LibPath"],
                          "/srtmVN/extdata/srtm90.tif"))) {
    message("SRTM data are not on disk.")
    message("Do you want to download them from the internet (108.0 MB)?",
            " y (default) / n")
    ans <- readline()
    if (ans %in% c("y", "")) {
      path <- paste0(find.package("srtmVN"), "/extdata")
      if (!dir.exists(path)) dir.create(path)
      download.file("http://marcchoisy.free.fr/srtm90.tif",
                    paste0(path, "/srtm90.tif"), mode = "wb")
    } else {
      return(NULL) #nocov
    }
  }
  data("srtm90", package = "srtmVN", envir = environment())
  srtm90@file@name <- system.file("extdata", "srtm90.tif", package = "srtmVN")
  srtm90
}
