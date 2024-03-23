#' Venn diagram widget
#' @description Creates an \code{amVennDiagram} widget.
#'
#' @param data a list such as one returned by \code{\link{makeVennData}}
#' @param theme the theme: \code{"default"}, \code{"dark"}, \code{"dataviz"},
#'   \code{"frozen"}, \code{"kelly"}, \code{"material"}, \code{"moonrise"},
#'   or \code{"spirited"}
#' @param title chart title
#' @param elementId a HTML id (usually useless)
#'
#' @returns An \code{amVennDiagram} widget.
#'
#' @importFrom htmlwidgets createWidget
#'
#' @export
#' @examples
#' sets <- list(A = 1:20, B = 10:30, C = 15:35)
#' dat <- makeVennData(sets)
#' amVennDiagram(dat, theme = "kelly")
amVennDiagram <- function(
    data, theme = "default", title = "", elementId = NULL
) {
  theme <- match.arg(
    theme,
    c(
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
  # filter and sort data
  data   <- Filter(function(x) x[["count"]] >= 1L, data)
  counts <- sapply(data, `[[`, "count")
  data   <- data[order(counts, decreasing = TRUE)]
  # forward options using x
  x <- list(
    data  = data,
    theme = theme,
    title = title
  )
  # create widget
  createWidget(
    name = "amVennDiagram",
    x,
    width = NULL,
    height = NULL,
    package = "amVennDiagram5",
    elementId = elementId
  )
}

#' Shiny bindings for 'amVennDiagram'
#' @description Output and render functions for using \code{amVennDiagram}
#'   within Shiny applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height a valid CSS dimension (like \code{"100\%"},
#'   \code{"400px"}, \code{"auto"}) or a number, which will be coerced to a
#'   string and have \code{"px"} appended
#' @param expr an expression that generates an \code{\link{amVennDiagram}}
#' @param env the environment in which to evaluate \code{expr}
#' @param quoted logical, whether \code{expr} is a quoted expression
#'   (with \code{quote()}); this is useful if you want to save an expression
#'   in a variable
#'
#' @returns \code{amVennDiagramOutput} returns an output element that can be
#'   included in a Shiny UI definition, and \code{renderAmVennDiagram} returns a
#'   \code{shiny.render.function} object that can be included in a Shiny server
#'   definition.
#'
#' @name amVennDiagram-shiny
#'
#' @export
#' @importFrom htmlwidgets shinyWidgetOutput shinyRenderWidget
#'
#' @examples
#' if(require("shiny") && interactive()) {
#'
#' library(amVennDiagram5)
#' library(shiny)
#'
#' sets <- list(A = 1:20, B = 15:38, C = c(0:5, 20, 30:40))
#' diagram  <- makeVennData(sets)
#'
#' ui <- fluidPage(
#'   sidebarLayout(
#'     sidebarPanel(
#'       radioButtons(
#'         "theme", label = "Theme",
#'         choices = c(
#'           "default",
#'           "dark",
#'           "dataviz",
#'           "frozen",
#'           "kelly",
#'           "material",
#'           "moonrise",
#'           "spirited"
#'         )
#'       )
#'     ),
#'     mainPanel(
#'       amVennDiagramOutput("diagram", height = "95vh")
#'     )
#'   )
#' )
#'
#' server <- function(input, output, session) {
#'
#'   output[["diagram"]] <- renderAmVennDiagram({
#'     amVennDiagram(
#'       diagram, theme = input[["theme"]]
#'     )
#'   })
#'
#' }
#'
#' shinyApp(ui, server)
#'
#' }
amVennDiagramOutput <- function(outputId, width = "100%", height = "400px") {
  shinyWidgetOutput(
    outputId, "amVennDiagram", width, height, package = "amVennDiagram5"
  )
}

#' @rdname amVennDiagram-shiny
#' @export
renderAmVennDiagram <- function(expr, env = parent.frame(), quoted = FALSE) {
  if(!quoted) {
    expr <- substitute(expr)
  } # force quoted
  shinyRenderWidget(expr, amVennDiagramOutput, env, quoted = TRUE)
}
