# An R Interface to use the google maps base layer with Leaflet Maps

[Leaflet](http://leafletjs.com) is an open-source JavaScript library for interactive maps. 
This R package is an add-on to the Leaflet maps library.
It allows the user to use google maps as base layer with the leaflet maps in R.

## Installation

You can install this package using the development version from Github:

```r
# Github version
if (!require('devtools')) install.packages('devtools')
devtools::install_github('KillianDudduss/LeafletGoogle2')
```

## Use it in an R script

There are some things you will need to do to use the package,

This is a quick example of how you need to use the package :

```r
# In the UI part of the app (before you use any of the functions from the package):

library(leafletGoogle2)

shinyUI(bootstrapPage(
     useLeafletGoogle(),
     # The code you want to write
     )
)
```

```r
# In the server part of the app (this is just an example of how to use the function):

shinyServer(function(input, output,session) {
      # Some code before you want to call the function
      leaflet %>%
        addGoogleTiles(layerId = "googleTileSat",
                       options = tileOptions(maxZoom = 15,
                                             updateWhenZooming = TRUE),
                       type = "satellite",
                       group = "Satellite (default)")
      # Some code after you have called the function
}
```

