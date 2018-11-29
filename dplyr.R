#dplyr and tidyr

library(tidyverse)

interviews <- read_csv("data/SAFI_clean.csv", na = "NULL")

#select a subset of columns using the selectet () function

select(interviews, village, no_membrs, years_liv) # tidyverse does not need the double quotations if the column names are not r object

select(interviews, village:rooms)

# filter () function is used to subset rows

filter(interviews, village == "God")

filter(interviews, village == "God", rooms > 2)

# filter and select

interviews2 <- filter(interviews, village == "God")

interviews_god <- select(interviews2, no_membrs, years_liv)

interviews_god

# to avoid clutter, you can overwrite an object however, an error at a point affects all subsequent operations

# Alternatively run the codes in one step

interviews_god <- select(filter(interviews, village == "God"), no_membrs, years_liv)

interviews_god

#Piping dataset into filter works in a sequentila manner rather than from inside out like the code above

interviews %>% filter(village == "God") %>% select(no_membrs, years_liv)
