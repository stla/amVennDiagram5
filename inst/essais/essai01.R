library(amVennDiagram5)

diagrams <- allVennDiagrams(c(2, 2, 1), output = "lists")
length(diagrams)
diagram <- diagrams[[1]]
amVennDiagram(diagram)


library(amVennDiagram5)

sets <- list(A = 1:20, B = 15:38, C = c(0:5, 20, 30:40))
dat <- makeVennData(sets)
amVennDiagram(dat, theme = "kelly")



library(amVennDiagram5)

sets <- list(A = 1:20, B = 15:38, C = c(0:5, 20, 30:40), D = c(3:7, 20:25))
dat <- makeVennData(sets)
amVennDiagram(dat, theme = "kelly")
