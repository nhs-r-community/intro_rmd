library(tidyverse)
library(pander)

my_plot <- function(data) {
  
if (data == 'mtcars') {
  
mtcars %>% ggplot() +
  geom_point(aes(x = wt, y = mpg)) +
    geom_smooth(aes(x = wt, y = mpg))
}
  
  else {
    
iris %>% ggplot() +
    geom_point(aes(x = Sepal.Length, y = Sepal.Width)) +
      geom_smooth(aes(x = Sepal.Length, y = Sepal.Width))
  }
}


my_lm <- function(data) {
  
  if (data == 'mtcars') {
    
    pander(summary(lm(mpg ~ wt, data = mtcars)))
    
  }
  
  else {
    
    pander(summary(lm(Sepal.Width ~ Sepal.Length, data = iris)))
    
  }
  
}




make.tabs <- function(data){
  res <- list()
  for (i in seq_along(data)) {
          res[[i]]  <- c(paste('###', data[i]), '\n',
             paste('#### My Plot', i), '\n',
             "```{r, results = 'asis'}", '\n',
             "print('Hello World')", '\n',
             "my_plot('", data[i] ,"')", '\n',
             '```', '\n\n',
             
             paste('#### My Linear Model', i), '\n',
             "```{r, results = 'asis'}", '\n',
             "print('Hello World')", '\n',
             "my_lm('", data[i] ,"')", '\n',
             '```', '\n\n')
  }
          return(unlist(res))

}


my_tabs <- make.tabs(c('mtcars','iris'))

# Create the Rmd to knit
cat(
  
'---
title: "Untitled"
author: "author"
date: "2017-10-23"
output: html_document
---
# Some Tabs
## {.tabset}

```{r}
library(dplyr)
library(tidyverse)
```
',make.tabs(c('mtcars','iris')),
  sep = "",
  file = "filetoknit.Rmd")



rmarkdown::render("filetoknit.Rmd")



