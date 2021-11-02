# Load Libraries

if (!require("pacman")) install.packages("pacman"); library(pacman)

p_load(tidyverse, lubridate, readxl)

# Read in our Data

dat <- read_xlsx("./data/TOA_Data.xlsx")

# Create our Objects

my_graph <- dat %>%
  group_by(Month, Hour_Start) %>%
  summarise(count = sum(count, na.rm = T)) %>%
  ggplot() +
  geom_point(aes(x = as.numeric(Hour_Start), y = count, color = Month)) +
  geom_line(aes(x = as.numeric(Hour_Start), y = count, color = Month, group = Month)) +
  scale_x_continuous(breaks = seq(0,23,1)) +
  theme_classic()


render("exercises/Sequential_Automation_Markdown.Rmd")


