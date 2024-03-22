library(amVennDiagram5)

diagrams <- allVennDiagrams(c(2, 2, 1), output = "lists")
length(diagrams)

diagram <- diagrams[[1]]

amVennDiagram(diagram)
