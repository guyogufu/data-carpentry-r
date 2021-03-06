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

# Using pipes, subset the interviews data to include interviews where respondents 
# were members of an irrigation association (memb_assoc) and retain only the columns 
# affect_conflicts, liv_count, and no_meals

interviews %>% filter(memb_assoc == "yes") %>% select(affect_conflicts, liv_count, no_meals)

# mutate uses pipe to enable adding a variable/column to dataset i.e. interviews

interviews <- interviews %>% mutate(people_per_room = no_membrs/rooms)

# to group data by a variable in order to find some meaningful info about the diffrent categories
# we can pipe by that variable

interviews %>% group_by(village) %>% summarise(mean_no_membrs = mean(no_membrs))

interviews %>% group_by(village) %>% filter(memb_assoc == "yes") %>% 
  summarise(mean_no_membrs = mean(no_membrs))

interviews %>% group_by(village, memb_assoc) %>% summarise(mean_no_membrs = mean(no_membrs),
                                                           min_membrs = min(no_membrs))

# count of entries/frequency of a value e.g. village

interviews %>% count(village)

interviews %>% count(village, sort = TRUE) # sort from most to least

# Use group_by() and summarize() to find the mean, min, and max number of household members 
# for each village. Also, add the number of observations.

interviews %>% group_by(village) %>% 
  summarise(mean_no_membrs = mean(no_membrs),
  min_membrs = min(no_membrs), 
  max_no_membrs = max(no_membrs), total_membrs = n())
