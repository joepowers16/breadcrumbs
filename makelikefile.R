# Executing this file will recreate all analysis in this project
source("file_paths.R")
library(breadcrumbs)

# DATA MUNGE ####
list.files(here::here("munge"))
source(here::here("munge", "create_ds_grades.R"))
source(here::here("munge", "create_ds_surveys.R"))
source(here::here("munge", "create_ds_demographics.R"))
source(here::here("munge", "create_ds_state_tests.R"))

# DATA ANALYSIS ####
list.files(dir_analysis)
source_rmd(here::here("analysis", "mindset_eda.Rmd"))
