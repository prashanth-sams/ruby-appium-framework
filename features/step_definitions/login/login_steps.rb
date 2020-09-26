# frozen_string_literal: true

When(/^I login Vivino account$/) do
  profile = ProfileScreen.new(@driver)
  login = LoginScreen.new(@driver)
  create = CreateAccountScreen.new(@driver)

  step('I logout current user') if is_exist?(profile.pseudo_profile_image)

  login.input_email.send_keys(create.email)
  login.input_password.send_keys(create.password)
  login.sign_in.click
end

Then(/^I logout current user$/) do
  profile = ProfileScreen.new(@driver)
  login = LoginScreen.new(@driver)

  profile.more_options.click
  profile.settings.click
  assert_text(profile.settings_header, 'Settings')

  swipe_until(profile.pseudo_sign_out, 8)
  profile.sign_out.click
  profile.sign_out_accept.click
  assert_text(login.header, 'Welcome Back')
end

Then(/^I validate the user login$/) do
  profile = ProfileScreen.new(@driver)

  assert_text(profile.top_list_header, 'Top Lists')
end
