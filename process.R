library(shiny)
library(leaflet)
library(tidyverse)

raw_nypd_major_felonies <- read_csv("NYPD_7_Major_Felony_Incidents.csv") 

clean_nypd_major_felonies <- raw_nypd_major_felonies %>% 
  tidyr::separate(col = `Location 1`, 
                into  = c("Latitude", "Longitude"),
                sep = ",",
                remove = FALSE) %>% 
  mutate(Latitude = as.numeric(str_replace_all(Latitude, "[(]", "")),
         Longitude = as.numeric(str_replace_all(Longitude, "[)]", "")))

sample_data <- clean_nypd_major_felonies[c(1:1000),]

saveRDS(sample_data, "./sample_data.rds")
