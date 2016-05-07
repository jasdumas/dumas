library(dumas)
context("z-score")

test_that("z_score gives the correct calculation output", {
  expect_equal(z_score(x = c(1, 2, 3)), c(-1, 0, 1))

})
