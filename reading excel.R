library("readxl")
library("xlsx")
products = read.xlsx("products.xlsx", sheetIndex = 1,header = TRUE)
View(products)
