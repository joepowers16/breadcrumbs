ds_test <- tibble::tibble(var_name = c("1,2,3", "1,2,3,4"))

ds_sep <- separate_n(ds_test, var_name, ",")
names_expected <- c("var_name_1", "var_name_2", "var_name_3", "var_name_4")

test_that("separate_n() correctly names newly created variables", {
  expect_equal(names(ds_sep), names_expected)
})
