# Purpose: Simulates the data similar to the expected dataset. 
# Author: Xinxiang Gao
# Date: 31 October 2024
# Contact: xinxiang.gao@mail.utoronto.ca
# License: MIT

# Load necessary libraries
library(tidyverse)
library(lubridate)

# Set a seed for reproducibility
set.seed(690)

num_rows <- 1000  # Total number of events to simulate


states <- c("Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", 
            "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", 
            "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", 
            "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", 
            "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", 
            "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", 
            "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", 
            "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", 
            "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming")

candidate_names <- c("Kamala Harris", "Donald Trump", "Joe Biden", "Bernie Sanders", "Elizabeth Ann Warren")
transparency_scores <- seq(0, 10, 0.5)
poll_ids <- 74681:89106
dates <- seq(as.Date("2021-04-07"), as.Date("2024-10-31"), by="month")

# Function to create a single poll entry with a random subset of candidates
create_poll <- function(poll_id, state, date, transparency_score) {
  # Randomly select 2 to 5 candidates
  num_candidates <- sample(2:5, 1)
  selected_candidates <- sample(candidate_names, num_candidates)
  
  # Generate random percentages for the selected candidates, normalized to sum to 1
  pct <- runif(num_candidates)
  pct <- round(pct / sum(pct) * 100, 2)
  
  # Create a data frame for each poll
  data.frame(
    poll_id = poll_id,
    state = state,
    end_date = date,
    transparency_score = transparency_score,
    candidate_name = selected_candidates,
    pct = pct
  )
}

simulated_data <- lapply(1:500, function(i) {
  create_poll(
    poll_id = sample(poll_ids, 1),
    state = sample(states, 1),
    date = sample(dates, 1),
    transparency_score = sample(transparency_scores, 1)
  )
}) %>% bind_rows()


# Print the first few rows of the simulated data to check
print(head(simulated_data))

# Save the simulated dataset to a CSV file
write.csv(simulated_data, "data/00-simulated_data/simulated_polls.csv", row.names = FALSE)
