# Purpose: Tests the simulated data and the analysis data. 
# Author: Xinxiang Gao
# Date: 31 October 2024
# Contact: xinxiang.gao@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(testthat)

data <- read_csv("data/00-simulated_data/simulated_polls.csv")


#### Test simulated data ####

# Test that 'poll_id' is integer type
test_that("'poll_id' is integer", {
  expect_type(data$poll_id, "integer")
})

# Test that 'state' column is character type
test_that("'state' is character", {
  expect_type(data$state, "character")
})

# Test that 'end_date' column is Date type
test_that("'end_date' is Date", {
  expect_true(all(class(data$end_date) == "Date"))
})

# Test that 'transparency_score' is numeric type
test_that("'transparency_score' is numeric", {
  expect_type(data$transparency_score, "double")
})

# Test that 'candidate_name' column is character type
test_that("'candidate_name' is character", {
  expect_type(data$candidate_name, "character")
})

# Test that 'pct' column is numeric type
test_that("'pct' is numeric", {
  expect_type(data$pct, "double")
})

# Test that there are no missing values in the dataset
test_that("no missing values in dataset", {
  expect_true(all(!is.na(data)))
})

# Test that each poll (by poll_id) sums to 1 in pct column
test_that("pct sums to 1 within each poll_id", {
  pct_sums <- data %>% group_by(poll_id) %>% summarize(pct_sum = sum(pct))
  expect_true(all(abs(pct_sums$pct_sum - 1) < 1e-6))  # Allow for minor floating-point variations
})

# Test that 'num_candidates' is between 2 and 5
test_that("num_candidates is between 2 and 5", {
  expect_true(all(data$num_candidates >= 2 & data$num_candidates <= 5))
})

# Test that 'transparency_score' is within expected range (0 to 10)
test_that("transparency_score is between 0 and 10", {
  expect_true(all(data$transparency_score >= 0 & data$transparency_score <= 10))
})

# Test that 'state' contains only valid US states
valid_states <- c("Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", 
                  "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", 
                  "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", 
                  "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", 
                  "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", 
                  "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", 
                  "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", 
                  "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", 
                  "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming")
test_that("'state' contains valid US state names", {
  expect_true(all(data$state %in% valid_states))
})

# Test that 'candidate_name' contains at least 2 unique values
test_that("'candidate_name' column contains at least 2 unique values", {
  expect_true(length(unique(data$candidate_name)) >= 2)
})

# Test that 'pct' is a decimal between 0 and 1 for each candidate
test_that("'pct' is between 0 and 1", {
  expect_true(all(data$pct >= 0 & data$pct <= 1))
})

# Test that there are no empty strings in 'state', 'candidate_name', or 'poll_id'
test_that("no empty strings in 'state', 'candidate_name', or 'poll_id'", {
  expect_false(any(data$state == "" | data$candidate_name == "" | is.na(data$poll_id)))
})