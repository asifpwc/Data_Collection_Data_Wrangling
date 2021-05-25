library(RSQLite)
library(xlsx)
data("mtcars")
mtcars$car_names = rownames(mtcars)
rownames(mtcars) = c()
conn = dbConnect(RSQLite::SQLite(),"Cars_DB.db")
dbWriteTable(conn,"cars_data",mtcars)
dbListTables(conn)
dbListFields(conn,"cars_data")
dbReadTable(conn,"cars_data")
dbGetQuery(conn,"select * from cars_data" )
dbGetQuery(conn,"select cyl, avg(hp) as hp_avg from cars_data group by cyl")

products = read.xlsx("products.xlsx", sheetIndex = 1,header = TRUE)
conn1 = dbConnect(RSQLite::SQLite(),"Products.db")
dbWriteTable(conn1,"Products_data",products)
rec = dbSendQuery(conn1,"select * from Products_data")

while (!dbHasCompleted(rec)) {
  chunk = dbFetch(rec,n=5)
  print(nrow(chunk))
}

