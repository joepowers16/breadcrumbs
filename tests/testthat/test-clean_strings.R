my_input <- c("five^4")
my_ouput <- c("five_4")

test_that("hats are replaced", {
  expect_equal(clean_strings(my_input), my_ouput)
})
