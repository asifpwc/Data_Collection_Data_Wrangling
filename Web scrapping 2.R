library(rvest)
library(dplyr)
link = "https://www.imdb.com/search/title/?title_type=feature&num_votes=25000,&genres=adventure&sort=user_rating,desc"
page = read_html(link)
name = page %>% html_nodes(".lister-item-header a") %>% html_text()
movie_links = page %>% html_nodes(".lister-item-header a") %>% 
  html_attr("href") %>% paste("https://www.imdb.com", . ,sep = "")
year = page %>% html_nodes(".text-muted.unbold") %>% html_text()
rating = page %>% html_nodes(".ratings-imdb-rating strong") %>% html_text()
synopsis = page %>% html_nodes(".ratings-bar+ .text-muted") %>% html_text()

get_cast  = function(mlink){
  mpage = read_html(mlink)
  m_cast = mpage %>% html_nodes(".primary_photo+ td a") %>% html_text() %>% paste(collapse = ",")
  return(m_cast)
}

cast = sapply(movie_links, FUN = get_cast,USE.NAMES = FALSE)
movies = data.frame(name, year, rating,synopsis,cast,stringsAsFactors = FALSE)
View(movies)
