# frozen_string_literal: true

Then(/^I validate the account profile$/) do
  create = CreateAccountScreen.new(@driver)
  profile = ProfileScreen.new(@driver)

  assert_text(profile.header, 'My Profile')
  assert_text(profile.first_name, "Welcome #{create.firstname}")

  expect(profile.profile_image.displayed?).to be(true)
  expect(profile.my_wines.displayed?).to be(true)
  expect(profile.ratings.displayed?).to be(true)
  expect(profile.wishlist.displayed?).to be(true)
  expect(profile.cellar.displayed?).to be(true)
end
