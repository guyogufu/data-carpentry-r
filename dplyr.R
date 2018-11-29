#dplyr and tidyr

library(tidyverse)

interviews <- read_csv("data/SAFI_clean.csv", na = "NULL")

#select a subset of columns using the selectet () function

select(interviews, village, no_membrs, years_liv) # tidyverse does not need the double quotations if the column names are not r object

select(interviews, village:rooms)
