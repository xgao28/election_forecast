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

data <- read_csv("data/01-raw_data/president_polls.csv")

# Nevada: 6
# Arizona: 11
# Wisconsin: 10
# Michegan: 15
# Penn: 19
# North Carolina: 16
# Gerogia: 16


#### Save model ####
saveRDS(
  model,
  file = "models/first_model.rds"
)


