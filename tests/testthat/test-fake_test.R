test_that("multiplication works", {
  expect_equal(2 * 2, 4)
  fake <- config_setup("hi", "there")
  expect_null(fake)
})
