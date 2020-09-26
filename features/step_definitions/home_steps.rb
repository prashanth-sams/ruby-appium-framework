# frozen_string_literal: true

Given(/^I am on home screen$/) do
  home = HomeScreen.new(@driver)

  expect(home.home_image.displayed?).to be(true)
  expect(home.get_started.displayed?).to be(true)
  expect(home.how_it_works.displayed?).to be(true)
end
