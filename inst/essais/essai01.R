library(amVennDiagram5)

diagrams <- allVennDiagrams(c(3, 2), output = "lists")
diagram <- diagrams[[1]]

amVennDiagram(diagram)
