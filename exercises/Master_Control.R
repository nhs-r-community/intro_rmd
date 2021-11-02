### What if we have multiple Rmarkdown reports in a single file directory how would we run them all?


files <- list.files(pattern = "[.]Rmd$")

for (f in files) rmarkdown::render(f)



