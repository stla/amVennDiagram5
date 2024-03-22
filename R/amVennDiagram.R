#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
amVennDiagram <- function(message, width = NULL, height = NULL, elementId = NULL) {

  # forward options using x
  x = list(
    data = message
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'amVennDiagram',
    x,
    width = width,
    height = height,
    package = 'amVennDiagram5',
    elementId = elementId
  )
}

#' Shiny bindings for amVennDiagram
#'
#' Output and render functions for using amVennDiagram within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a amVennDiagram
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name amVennDiagram-shiny
#'
#' @export
amVennDiagramOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'amVennDiagram', width, height, package = 'amVennDiagram5')
}

#' @rdname amVennDiagram-shiny
#' @export
renderAmVennDiagram <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, amVennDiagramOutput, env, quoted = TRUE)
}
