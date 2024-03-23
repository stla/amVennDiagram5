#' @importFrom partitions blockparts
#' @noRd
enumerateVennDiagrams <- function(dims) {
  worker <- function(n, d, tbl) {
    falses <- rep(FALSE, n)
    cardinalities <- vapply(tbl, `[[`, integer(1L), 2L)
    do.call(c, lapply(0L:min(d, sum(cardinalities)), function(k) {
      compstns <- blockparts(cardinalities, k)
      apply(compstns, 2L, function(comp) {
        h <- min(length(comp), length(tbl))
        L1 <- lapply(seq_len(h), function(i) {
          tfs <- tbl[[i]][[1L]]
          m   <- tbl[[i]][[2L]]
          list(c(FALSE, tfs), m - comp[i])
        })
        L2 <- lapply(seq_len(h), function(i) {
          tfs <- tbl[[i]][[1L]]
          list(c(TRUE, tfs), comp[i])
        })
        L3 <- list(list(c(TRUE, falses), d - k))
        c(L1, L2, L3)
      }, simplify = FALSE)
    }))
  }
  venns1 <- function(p) {
    list(list(list(TRUE, p)))
  }
  dims <- as.integer(dims)
  if(length(dims) == 0L) {
    list()
  } else if(length(dims) == 1L) {
    venns1(dims)
  } else {
    d <- dims[1L]
    ds <- dims[-1L]
    diagrams <- enumerateVennDiagrams(ds)
    do.call(c, lapply(diagrams, function(diagram) {
      worker(length(ds), d, diagram)
    }))
  }
}

#' @title Enumeration of Venn diagrams
#' @description Given the cardinalities of some sets, returns all possible
#'   Venn diagrams of these sets.
#'
#' @param cardinalities vector of positive integers
#' @param output either \code{"lists"} or \code{"dataframes"}
#'
#' @returns List of Venn diagrams.
#' @export
#' @importFrom utils combn
allVennDiagrams <- function(cardinalities, output = "dataframes") {
  output <- match.arg(output, c("dataframes", "lists"))
  nsets <- length(cardinalities)
  ABsets <- LETTERS[seq_len(nsets)]
  .diagrams <- enumerateVennDiagrams(cardinalities)
  diagrams <- lapply(.diagrams, function(diagram) {
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
  })
  if(output == "dataframes") {
    lapply(diagrams, function(diagram) {
      data.frame(
        "set"   = vapply(diagram, `[[`, character(1L), "name"),
        "count" = vapply(diagram, `[[`, integer(1L), "count")
      )
    })
  } else {
    diagrams
  }
}
