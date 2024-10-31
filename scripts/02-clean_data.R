#### Preamble ####
# Purpose: Cleaned the raw data by selecting necessary columns and statistically confident rows, as well as mutate days_towards_election.
# Author: Xinxiang Gao
# Date: 20 Oct 2024 
# Contact: xinxiang.gao@utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
data <- read_csv("data/01-raw_data/president_polls.csv")

# Select rows
data <- data %>%
  filter(numeric_grade >= 2.0)

# Mutate days_towards_election
data_a <- data %>% 
  select(end_date) %>% 
  mutate(end_date = as.Date(end_date, format="%m/%d/%y"))

election_date <- as.Date("11/5/24", format="%m/%d/%y")

data_a <- data_a %>% 
  mutate(days_towards_election = as.numeric(difftime(election_date, end_date, units = "days")))

data$days_towards_election <- data_a$days_towards_election

# Select columns
selected_columns <- c(
  "poll_id",
  "question_id",
  "pollster", 
  "sponsors", 
  "numeric_grade", 
  "pollscore", 
  "methodology", 
  "transparency_score", 
  "state", 
  "start_date", 
  "end_date", 
  "sponsor_candidate", 
  "sponsor_candidate_party", 
  "question_id", 
  "sample_size", 
  "population", 
  "population_full",
  "tracking", 
  "notes", 
  "source", 
  "internal", 
  "partisan", 
  "race_id", 
  "ranked_choice_reallocated", 
  "ranked_choice_round", 
  "hypothetical", 
  "party", 
  "answer", 
  "candidate_name", 
  "days_towards_election",
  "pct"
)
data <- data %>% 
  select(all_of(selected_columns))




#### Save data ####
write_csv(data, "data/02-analysis_data/cleaned_president_polls.csv")

