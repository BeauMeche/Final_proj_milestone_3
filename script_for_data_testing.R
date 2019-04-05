
library(tidyverse)
library(readr)
library(ggplot2)


census_2017 <- read_csv(file = "Census_2017_edu_attainment.csv")
census_2016 <- read_csv(file = "Census_edu_attainment_2016.csv")
census_2015 <- read_csv(file = "Census_edu_attainment_2015.csv")
school_type_study <- read_csv(file = "Census_school_type_study_2017.csv")

x <- school_type_study %>% select(`GEO.display-label`, HD01_VD05) %>% 
  filter(`GEO.display-label`!= c("Geography","United States")) %>% 
  arrange(desc(as.integer(HD01_VD05))) %>%
  ggplot() + 
  geom_point(aes(x=`GEO.display-label`, y = HD01_VD05, color = "orange"), show.legend = FALSE)  +
  coord_flip() +
  labs(title = "2017 enrollment by state",
       subtitle = "public school counts only",
       caption = "Source: U.S. Census Bureau, 2017 American Community Survey 1-Year Estimates", 
       y = "enrollment counts: excuse the odd arrangement, this is a laborious endeavor", 
       x = "") + theme(axis.text.x = element_text(angle = -90, hjust = 1))
x