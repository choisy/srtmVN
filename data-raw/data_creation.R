# NOTE: in order to save space, the data-raw/dropbox directory is not tracked by
# Git and thus not saved on GitHub. Instead, the directory is accessible from
# Dropbox here:
#      www.dropbox.com/sh/r338sdioqhz1q4b/AABHwnzLgTLZNxX9aWkfxOwUa?dl=0 or
#      www.dropbox.com/sh/r338sdioqhz1q4b/AABHwnzLgTLZNxX9aWkfxOwUa?raw=1
#
library(raster)  # for "getData", "mosaic", "crop", "mask", "writeRaster", "raster"
lon <- c(102.5, 107.5)  # the longitudes values of the tiles
lat <- seq(7.5, 22.5, 5)  # the latitudes values of the tiles
coord <- expand.grid(lon, lat)  # the coordinates of the tiles
# (Downloading and) loading the tiles from srtm.csi.cgiar.org:
srtm90 <- mapply(getData, name = "SRTM", lon = coord[, 1], lat = coord[, 2],
                 USE.NAMES = FALSE, path = "data-raw/dropbox/data-raw")
# Merging the tiles (takes about 80 seconds):
srtm90 <- do.call(function(...) mosaic(..., fun = mean), srtm90)
# Cropping around the borders of the country (makes the object smaller in memory):
gadm0r <- gadmVN:::gadm0r
srtm90 <- crop(srtm90, gadm0r)
# Rasterizing
themask <- rasterize(gadm0r, srtm90)
# Masking around the borders (makes it even smaller in memory):
srtm90 <- mask(srtm90, themask)
# Saving:
destdir <- "data-raw/dropbox/extdata"
destfile <- paste0(destdir, "/srtm90.tif")
if (!dir.exists(destdir)) dir.create(destdir)
writeRaster(srtm90, destfile, "GTiff", overwrite = TRUE)
srtm90 <- raster(destfile)
usethis::use_data(srtm90, overwrite = TRUE)
