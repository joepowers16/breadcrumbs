library(tidyverse)

setwd("~/coding/breadcrumbs/data/breadcrumbs_cloud_data")
file.create("grades.rds")
file.create("demographics.rds")
file.create("state_tests.rds")

setwd("~/coding/breadcrumbs/data/breadcrumbs_cloud_data/raw/student_data/grades")
file.create("september 2013 grades.xls")
file.create("Spring 2014 academic.xls")
file.create("september 2014 subject grades.xlsx")
file.create("Spring 2015.csv")
file.create("Dec2015 academic.xls")
file.create("Semester2Grades_June2016_ACADEMIC.xls")
file.create("Semester2Grades_June2016_ACADEMIC_kids_I forgot.xls")

setwd("~/coding/breadcrumbs/data/breadcrumbs_cloud_data/raw/student_data/demographics")
file.create("2013 student race and gender.xls")
file.create("race and gender 2014 sept.xls")
file.create("2015 demog.xls")


setwd(here::here("data", "breadcrumbs_cloud_data"))
v_races <- c("black", "white", "asian", "pac_isl", "biracial", "latinx")

ds_demog <-
  tibble(
    id = 1000:1999,
    race = sample(v_races, 1000, replace = TRUE),
    dob = "2000-01-16",
    gender = sample(c("male", "female"), 1000, replace = TRUE)
  )

write_rds(ds_demog, "demographics.rds")

ds_state <-
  tibble(
    id = rep(1000:1999, 3),
    subject = c(rep("math", 1000), rep("english", 1000), rep("science", 1000)),
    test_date = rep("2013-05-16", 3000),
    score = sample(60:100, 3000, replace = TRUE)
  ) %>%
  mutate(test_date = lubridate::ymd(test_date))

write_rds(ds_state, "state_tests.rds")

v_subjects <- c("Algebra", "Reading", "Art", "Biology", "Physical Education")
ds_grades <-
  tibble(
    id = rep(1000:1999, each = 5),
    subject = rep(v_subjects, 1000),
    test_date = rep("2013-12-16", 5000),
    score = sample(60:100, 5000, replace = TRUE)
  )

ds_grades <- ds_grades %>%
  mutate(test_date = lubridate::ymd(test_date))

write_rds(ds_grades, "grades.rds")

setwd(here::here("data", "breadcrumbs_cloud_data", "raw", "surveys"))

ds_surveys <-
  tibble(
    id = rep(1000:1999),
    survey_date = rep("2014-05-16", 1000),
    mindset_1 = sample(1:6, 1000, replace = TRUE),
    mindset_2 = sample(1:6, 1000, replace = TRUE),
    mindset_3 = sample(1:6, 1000, replace = TRUE)
  )

write_csv(ds_surveys, "2014_survey")

ds_surveys <-
  tibble(
    id = rep(1000:1999),
    survey_date = rep("2015-05-16", 1000),
    MS_1 = sample(1:6, 1000, replace = TRUE),
    MS_2 = sample(1:6, 1000, replace = TRUE),
    MS_3 = sample(1:6, 1000, replace = TRUE)
  )

write_csv(ds_surveys, "Qualtrics_2015.csv")

ds_surveys <-
  tibble(
    id = rep(1000:1999),
    survey_date = rep("2016-05-16", 1000),
    Q1 = sample(1:6, 1000, replace = TRUE),
    Q2 = sample(1:6, 1000, replace = TRUE),
    Q3 = sample(1:6, 1000, replace = TRUE)
  )

write_csv(ds_surveys, "2016_survey.csv")

