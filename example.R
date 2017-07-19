###################
#### Libraries ####
###################
library(leaflet)
library(shiny)
library(LeafletGoogle)
###################

ui <- fluidPage(
  useLeafletGoogle(),
  titlePanel("Example!"),
  sidebarLayout(
    sidebarPanel(
      # Anything you want to add to control your map for example
      # For the example a button that doesn't do anything
      actionButton("button","Hit me.")
    ),
    mainPanel(
      # The rendered map 
      leafletOutput("mymap")
    )
  )
)


server <- function(input, output) {
  
  output$mymap <- renderLeaflet({
    leaflet()%>%
      addGoogleTiles(layerId = "googleTile",
                     options = tileOptions(maxZoom = 15,
                                           updateWhenZooming = TRUE))
  })
}

shinyApp(ui = ui, server = server)