test_that("multiplication works", {
  expect_equal(2 * 2, 4)
  fake <- config_setup("hi", "there")
  expect_null(fake)
})

test_that("fake 2", {

  expect_equal(bambooHR::build_url(),
               "https://api.bamboohr.com/api/gateway.php/there/v1")

})
