#' Venn diagram data from a list of sets
#' @description Make data for usage in \code{\link{amVennDiagram}}.
#'
#' @param sets a named list of vectors
#'
#' @return A list suitable for \code{\link{amVennDiagram}}.
#' @export
#' @importFrom venn extractInfo
#'
#' @examples
#' sets <- list(A = 1:20, B = 10:30, C = 15:35)
#' dat <- makeVennData(sets)
#' amVennDiagram(dat)
makeVennData <- function(sets) {
  info <- extractInfo(sets, use.names = TRUE)[-1L, ]
  info[["name"]] <- rownames(info)
  unname(lapply(split(info, seq_len(nrow(info))), function(row) {
    out <- list(
      "name"  = row[["name"]],
      "count" = row[["counts"]]
    )
    if(grepl(":", row[["name"]], fixed = TRUE)) {
      out[["sets"]] <- strsplit(row[["name"]], ":", fixed = TRUE)[[1L]]
    }
    out
  }))
}
