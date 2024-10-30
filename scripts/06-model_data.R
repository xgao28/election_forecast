#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(rstanarm)

#### Read data ####
#analysis_data <- read_csv("data/analysis_data/analysis_data.csv")

data <- read_csv("data/02-analysis_data/cleaned_president_polls.csv")

# Nevada: 6
# Arizona: 11
# Wisconsin: 10
# Michegan: 15
# Penn: 19
# North Carolina: 16
# Gerogia: 16
data_nevada <- data %>% filter(state == "Nevada") 
data_arizona <- data %>% filter(state == "Arizona") 
data_wisconsin <- data %>% filter(state == "Wisconsin") 
data_michigan <- data %>% filter(state == "Michigan") 
data_penn <- data %>% filter(state == "Pennsylvania") 
data_north_carolina <- data %>% filter(state == "North Carolina") 
data_georgia <- data %>% filter(state == "Georgia") 

candidate_names <- c("Kamala Harris", "Donald Trump")



#### Save model ####
saveRDS(
  model,
  file = "models/first_model.rds"
)


