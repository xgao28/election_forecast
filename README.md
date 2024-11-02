# 2024 US Election Forecast

## Overview

This repo aims to build a linear, or generalized linear, model to forecast the winner of the upcoming US presidential election using “poll-of-polls” and write a story from the observations.

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from https://projects.fivethirtyeight.com/polls/president-general/2024/national/ following Data Retrieval procedures. 
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models. 
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.

## Data Retrieval

Data about polling outcomes from https://projects.fivethirtyeight.com/polls/president-general/2024/national/. On the page, search for “Download the data”, then select Presidential general election polls (current cycle), then click Download.

## Statement on LLM usage

Aspects of the code were written with the help of ChatGPT. The entire chat history is available in inputs/llms/usage.txt.
