library(fs)

dir_raw <- here::here("breadcrumbs_cloud", "raw")
dir_data <- here::here("breadcrumbs_cloud", "data")

file_ds_surveys <- path(dir_data, "ds_surveys.rds")
file_ds_grades <- path(dir_data, "ds_grades.rds")
file_ds_state_tests <- path(dir_data, "ds_state_tests.rds")
file_ds_demographics <- path(dir_data, "ds_demographics.rds")
