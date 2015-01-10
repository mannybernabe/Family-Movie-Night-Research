remove(list=ls())

library(RCurl);library(jsonlite)
library(dplyr):library(ggplot2)
library("devtools");library("plotly")

#Login and API details
api.key <- <your Rotten Tomatoes API key> 
py <- plotly(<your plotly username>, <your plotly api key>) 

rt <- getURI(paste0("http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=", api.key, "&limit=50"))
rt <- fromJSON(rt)

title <- rt$movies$title
critics <- rt$movies$ratings$critics_score
audience <- rt$movies$ratings$audience_score
rating <- rt$movies$mpaa_rating
df <- data.frame(title=title, critic.score=critics,
                 audience.score=audience,Rating=rating)


scatterplot<-ggplot(df, aes(x=critic.score, y=audience.score,color=Rating)) +
  geom_point()+geom_text(aes(label=title), size=3)+
  ggtitle("Movie Rental Rottent Tomatoes Audience and Critic Score")+
  xlab("Critic Score") +
  ylab("Audience Score")

py$ggplotly(scatterplot)


