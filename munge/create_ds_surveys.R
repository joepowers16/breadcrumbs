# Overview:
#' This script merges the raw surveys into one tidy dataset after standardizing variable names

library(lubridate)
library(magrittr)
library(tidyverse)

source("file_paths.R")

list.files(paste(dir_raw, "surveys", sep = "/"))

file_ds_survey_2014 <- paste(dir_raw, "surveys", "2014_survey.csv", sep = "/")
file_ds_survey_2015 <- paste(dir_raw, "surveys", "Qualtrics_2015.csv", sep = "/")
file_ds_survey_2016 <- paste(dir_raw, "surveys", "2016_survey.csv", sep = "/")

ds_survey_2014 <- read_csv(file_ds_survey_2014)
ds_survey_2015 <- read_csv(file_ds_survey_2015)
ds_survey_2016 <- read_csv(file_ds_survey_2016)

names(ds_survey_2014)
names(ds_survey_2015)
names(ds_survey_2016)

survey_rename <- function(x){
  str_replace_all(x, c("MS"="mindset", "Q"="mindset_"))
}

names(ds_survey_2015) <- survey_rename(names(ds_survey_2015))
names(ds_survey_2016) <- survey_rename(names(ds_survey_2016))

ds_surveys <- bind_rows(ds_survey_2014, ds_survey_2015, ds_survey_2016)

ds_surveys %<>%
  mutate(
    survey_date = ymd(survey_date),
    id = as.integer(id)
  )

write_rds(ds_surveys, file_ds_surveys)
