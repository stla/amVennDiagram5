library(amVennDiagram5)
library(shiny)

diagrams <- allVennDiagrams(c(2, 2, 1), output = "lists")

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      radioButtons(
        "index",
        "Diagram",
        choices = 1:9,
        selected = 4
      )
    ),
    mainPanel(
      amVennDiagramOutput("diagram")
    )
  )
)

server <- function(input, output, session) {

  output[["diagram"]] <- renderAmVennDiagram({
    # sess <- getDefaultReactiveDomain()
    # sess$sendCustomMessage("diagram_destroy", TRUE)
    i <- as.integer(input[["index"]])
    print(i)
    amVennDiagram(
      diagrams[[i]], theme = "material", title = "Venn diagram"
    )
  })

}

shinyApp(ui, server)

