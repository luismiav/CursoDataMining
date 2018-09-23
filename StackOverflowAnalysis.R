# Draft inizializado

# Dataset description

# To be filled-in

# Let's start by importing the data sets and data schema (easier to read inside the R-Studio)

library(readr)
survey_results_schema <- read_csv("survey_results_schema.csv")
View(survey_results_schema)

library(readr)
survey_results_public <- read_csv("survey_results_public.csv")
View(survey_results_public)

# First thing to do is to explore the data, what is in it, if it is clean/complete, etc



# Then we can look into ideas what "question go answer" by looking in Kaggle some Kernels
# https://www.kaggle.com/stackoverflow/so-survey-2017/kernels



# I was curious to practice a bar chart to see # of contributions per country
library(ggplot2)
