if (!require("pacman")) install.packages("pacman"); library(pacman)

p_load(tidyverse, readxl, lubridate)


tele <- readxl::read_xlsx("data/Times of Access Jan - April 2021.xlsx", sheet = "Times of Access 24hr")

tele <- tele %>%
  pivot_longer(!Telecoach, names_to = "date", values_to = "count") %>%
  filter(!date %in% c("Total", "Mar-21", "Apr-21", "Jan-21", "Feb-21")) %>%
  mutate(date = as.Date(as.numeric(as.character(date)), origin = '1899-12-30')) %>%
  separate(Telecoach, into = c("Start"), sep = "-") %>%
  separate(Start, into = "Hour_Start", sep = ":") %>%
  mutate(Month = month.name[month(date)])


writexl::write_xlsx(tele, "data/TOA_Data.xlsx")



