library(rvest)
library(dplyr)
link = "https://www.patriotsoftware.com/blog/accounting/average-cost-living-by-state/"
page_source = read_html(link)
htmltable = page_source %>% html_nodes("table") %>% html_table()  %>% . [[1]]

wiki_link = "https://en.wikipedia.org/wiki/List_of_apple_cultivars"
wiki_source = read_html(wiki_link)
wikiTable = wiki_source %>% html_nodes("table") %>% . [2] %>% html_table(fill = TRUE) %>% .[[1]]

W_img = wiki_source %>% html_nodes(".jquery-tablesorter img")
