# frozen_string_literal: true

When(/^I create Vivino account$/) do
  home = HomeScreen.new(@driver)
  create = CreateAccountScreen.new(@driver)

  home.get_started.click
  assert_text(create.create_acc_header, 'Create account')

  # create a real user account
  create.create_user
end
