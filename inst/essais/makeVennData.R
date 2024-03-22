x <- list(First = 1:20, Second = 10:30, Third = sample(25:50, 15))
info <- extractInfo(x, use.names = TRUE)[-1L, ]
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
