x <- list(First = 1:20, Second = 10:30, Third = sample(25:50, 15))
info <- venn::extractInfo(x, use.names = FALSE)[-1L, ]
nsets <- length(x)
diagram <- unname(lapply(split(info, seq_len(nrow(info))), function(row) {
  list(
    as.logical(row[1L:nsets]),
    as.integer(row[nsets + 1L])
  )
}))
ABsets <- LETTERS[seq_len(nsets)]
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
