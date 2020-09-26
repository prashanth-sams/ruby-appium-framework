@login
Feature: Vivino Login

  Background: Navigate to the Home screen
    Given I am on home screen

  @create_account @e2e
  Scenario: Verify Vivino login
    When I create Vivino account
    Then I validate the account profile
    When I login Vivino account
    Then I validate the user login