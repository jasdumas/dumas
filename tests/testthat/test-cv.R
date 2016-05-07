library(dumas)
context("Cramer's V")

test_that("cv.test is numeric vector", {
  expect_equal(cv.test(rnorm(50), rnorm(50)), 1)

})
