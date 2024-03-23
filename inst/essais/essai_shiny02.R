library(amVennDiagram5)
library(shiny)

sets <- list(A = 1:20, B = 15:38, C = c(0:5, 20, 30:40))
diagram  <- makeVennData(sets)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      radioButtons(
        "theme", label = "Theme",
        choices = c(
          "default",
          "dark",
          "dataviz",
          "frozen",
          "kelly",
          "material",
          "moonrise",
          "spirited"
        )
      )
    ),
    mainPanel(
      amVennDiagramOutput("diagram", height = "95vh")
    )
  )
)

server <- function(input, output, session) {

  output[["diagram"]] <- renderAmVennDiagram({
    amVennDiagram(
      diagram, theme = input[["theme"]]
    )
  })

}

shinyApp(ui, server)

