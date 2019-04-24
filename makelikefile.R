# Executing this file will recreate all analysis in this project
source("file_paths.R")
library(breadcrumbs)
library(here)

# DATA MUNGE ####
list.files(dir_munge)
source("munge", "create_ds_grades.R")
source("munge", "create_ds_surveys.R")

# DATA ANALYSIS ####
list.files(dir_analysis)
source_rmd("analysis", "mindset_eda.Rmd")
