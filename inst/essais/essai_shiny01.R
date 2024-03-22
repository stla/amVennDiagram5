library(amVennDiagram5)
library(shiny)

diagrams <- allVennDiagrams(c(2, 2, 1), output = "lists")

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      radioButtons(
        "index",
        "Diagram",
        choices = 1:9
      )
    ),
    mainPanel(
      amVennDiagramOutput("diagram")
    )
  )
)

server <- function(input, output, session) {

  output[["diagram"]] <- renderAmVennDiagram({
    i <- as.integer(input[["index"]])
    print(i)
    amVennDiagram(diagrams[[i]])
  })

}

shinyApp(ui, server)

