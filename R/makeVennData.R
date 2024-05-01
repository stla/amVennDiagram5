#' Venn diagram data from a list of sets
#' @description Make data for usage in \code{\link{amVennDiagram}}.
#'
#' @param sets a named list of vectors representing some sets
#'
#' @return A list suitable for usage in \code{\link{amVennDiagram}}.
#' @export
#' @importFrom venn extractInfo
#' @importFrom utils combn
#'
#' @examples
#' sets <- list(A = 1:20, B = 10:30, C = 15:35)
#' dat <- makeVennData(sets)
#' amVennDiagram(dat, theme = "spirited")
makeVennData <- function(sets) {
  info <- extractInfo(sets, use.names = FALSE)[-1L, ]
  nsets <- length(sets)
  diagram <- unname(lapply(split(info, seq_len(nrow(info))), function(row) {
    list(
      as.logical(row[1L:nsets]),
      as.integer(row[nsets + 1L])
    )
  }))
  ABsets <- names(sets)
  do.call(c, lapply(seq_len(nsets), function(k) {
    combs <- combn(nsets, k)
    lapply(seq_len(ncol(combs)), function(j) {
      comb <- combs[, j]
      sets <- ABsets[comb]
      ok <- Filter(function(x) all(x[[1L]][comb]), diagram)
      count <- sum(vapply(ok, `[[`, integer(1L), 2L))
      out <- list(
        "name"  = paste0(sets, collapse = ":"),
        "count" = count
      )
      if(length(sets) >= 2L) {
        out[["sets"]] <- sets
      }
      out
    })
  }))
}
