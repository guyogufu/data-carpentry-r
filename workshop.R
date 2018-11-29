library(tidyverse)
interviews <- read.csv("data/SAFI_clean.csv", na="NULL")
View(interviews)

# inspect data
head(interviews)

nrow (interviews)

ncol (interviews)

head (as.data.frame(interviews))

tail(interviews)

str(interviews)

summary(interviews)

names(interviews)

interviews [1, 1]

interviews [1, 6]

interviews [1:5, 6]

interviews [1, 1:4]

interviews [1, 1:14]

interviews [, 6]

interviews [1:6]

interviews ["respondent_wall_type"]

interviews [, -1]

interviews_100 <- interviews[100, ]
interviews_100
nrow(interviews)
interviews [131, ] 

interviews_last <- interviews [131, ]# or

interviews_last <- interviews[nrow(interviews), ]

interviews_middle <- interviews [round (nrow(interviews)/2), ]
interviews_middle
# Or

interviews_middle <- interviews [ceiling(nrow(interviews)/2), ]
interviews_middle

#create a factor

respondent_floor_type <- factor(c("earth", "cement", "cement", "earth"))
respondent_floor_type
levels(respondent_floor_type)
nlevels(respondent_floor_type) # how many levels are there

# specifying the levels in a specific order

respondent_floor_type <- factor(respondent_floor_type, levels = c("earth", "cement"))
respondent_floor_type
# we can use levels to reassign a level by subsetting
levels(respondent_floor_type)[2] <- "brick"
respondent_floor_type

#convert factor back to character

as.character(respondent_floor_type)

# a factor of years

year_fct <- factor(c(1990, 1983, 1977, 1998, 1990))
year_fct
# convert the year to numeric
as.numeric(year_fct) # factors are stored by r as numbers so using a factor as.numeric may not be a good idea

as.numeric(as.character(year_fct))
as.numeric(levels(year_fct)) [year_fct]

#extract a column from the datatset

affect_conflicts <- interviews$affect_conflicts # OR
affect_conflicts <- interviews [["affect_conflicts"]]# this extracts only the column as a vector without converting it into a dataframe which is what indexing normaly does
# convert to factor
affect_conflicts <- factor(affect_conflicts)
affect_conflicts
plot(affect_conflicts)

affect_conflicts <- interviews$affect_conflicts
affect_conflicts [is.na(affect_conflicts)] <- "undetermined"
str(interviews)


affect_conflicts <- as.character(interviews$affect_conflicts)

affect_conflicts [is.na(affect_conflicts)] <- "undetermined"

affect_conflicts <- factor(affect_conflicts)

plot(affect_conflicts)
levels(affect_conflicts)

levels(affect_conflicts) [2] <- "more than once"
levels(affect_conflicts)
plot(affect_conflicts)

#ordering the x-variables

affect_conflicts <- factor(affect_conflicts, levels = c("never", "once", "more than once", "frequently", "undetermined"))
plot(affect_conflicts)

#str function gives an overview of all the functions in the dataframe

str(interviews)

library(lubridate) # for working with dates

dates <- interviews$interview_date
head(dates)
dates <- ymd_hms(dates)

str(dates)

interviews$day <- day(dates)
interviews$month <- month(dates)
interviews$year <- year(dates)

str(interviews)
