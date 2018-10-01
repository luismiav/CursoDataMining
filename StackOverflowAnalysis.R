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

# Get an idea of the datashet
head(survey_results_public)

# Country column
print(survey_results_public$Country)

# How many times a country appear
table(survey_results_public$Country)

# We try to do the same with salary, but it is useless because there are too many different values
table(survey_results_public$Country)
# So we should set some ranges


# Then we can look into ideas what "question go answer" by looking in Kaggle some Kernels
# https://www.kaggle.com/stackoverflow/so-survey-2017/kernels


# Get mean salary per country and number of respondents

mean_salary= survey_results_public %>% group_by(Country) %>% summarise(mean=mean(Salary,na.rm=TRUE),number=n())

# Get top 10 respondent countries

top_mean_salary = top_n (mean_salary, 10)

cor(surverys_with_salary$Salary, surverys_with_salary$MajorUndergrad)
