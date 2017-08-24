# An R Interface to use the google maps base layer with Leaflet Maps

[Leaflet](http://leafletjs.com) is an open-source JavaScript library for interactive maps. 
This R package is an add-on to the Leaflet maps library.
It allows the user to use google maps as base layer with the leaflet maps in R.

## Installation

You can install this package using the development version from Github:

```r
# Github version
if (!require('devtools')) install.packages('devtools')
devtools::install_github('KillianDudduss/leafletGoogle')
```

## Use it in an R script with Shiny

In the package you have to use differents functions if you wish to use the package with or without shiny,

This is the example when you decide to use Shiny :

```r
# In the UI part of the app (before you use any of the functions from the package):

library(leafletGoogle)

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

## Use it in an R script without Shiny

This option is the second option, if you decide to run run some code, such as base leaflet functions or if you need to use packages such as mapView

This is an example (that works with base R, there are some problems with Rstudio) with the use of the mapview package :

```r
library(leaflet)
library(htmltools)
library(htmlwidgets)
library(mapview)
library(leafletGoogle)

# You need to insert a valid api google key to run the example 
apikey <- "INSERT YOU API KEY HERE"

leaflet() %>% setView(-122.23, 37.75, zoom = 10) %>%
  # The next function allow you to use the function addGTiles()
  initPlugin(apikey = apikey) %>%
  # You can now use the function addGTiles()
  addGTiles() %>%
  # I decide to use the function addMouseCoordinates() 
  # to show that the mapview package is working with the leafletGoogle package
  addMouseCoordinates(style = "basic")

```


