library(shiny)
library(waiter)
library(future)
plan(multisession)
library(httr)

foo <- function() {
  # Simulte a slow download
  cap_speed <- httr::config(max_recv_speed_large = 10000)
  GET("http://httpbin.org/bytes/102400", cap_speed)
}

ui <- fluidPage(
  useWaiter(),
  useHostess(),
  waiterShowOnLoad(
    color = "#f7fff7",
    hostess_loader(
      "loader",
      preset = "circle",
      text_color = "black",
      class = "label-center",
      center_page = TRUE
    )
  )
)

server <- function(input, output){
  hostess <- Hostess$new("loader")

  f <- future({ foo() })  # Create the future

  i <- 0
  while(!resolved(f)) {
    i <- i + 1
    hostess$set(min(99, 10 * i))
    print(i)
  }
  hostess$close()
  print("done")

}


shinyApp(ui, server)
