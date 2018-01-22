# srtmVN 

## Installation and loading

You can install `srtmVN` from [Bitbucket](https://bitbucket.org/choisy/srtmVN)

```{r eval = FALSE}
# install.packages("devtools")
devtools::install_bitbucket("choisy/srtmVN", build_vignettes = TRUE)
```

Once installed, you can load the package:

```{r}
library(srtmVN)
```

## Usage examples

The `RasterLayer` DEM from SRTM can be retrieved with the `getsrtm` function:

```{r}
srtm <- getsrtm()
```

It's a `RasterLayer` object:

```{r}
srtm
```

that can be plotted with the `plot` method:

```{r}
plot(srtm)
```

