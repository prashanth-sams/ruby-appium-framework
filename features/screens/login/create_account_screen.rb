# frozen_string_literal: true

class CreateAccountScreen
  EMAIL = Faker::Internet.email
  PASSWORD = Faker::Internet.password
  FIRSTNAME = Faker::Name.first_name
  LASTNAME = Faker::Name.last_name

  attr_reader :email, :password, :firstname, :lastname

  element :input_email, {id: 'vivino.web.app.beta:id/edtEmail'}
  element :input_password, {id: 'vivino.web.app.beta:id/edtPassword'}
  element :next_button, {id: 'vivino.web.app.beta:id/action_next'}
  element :input_firstname, {id: 'vivino.web.app.beta:id/edtUserName'}
  element :input_lastname, {id: 'vivino.web.app.beta:id/edtUserSurname'}
  element :select_country, {id: 'vivino.web.app.beta:id/txtCountryValue'}
  element :select_country_title, {id: 'vivino.web.app.beta:id/alertTitle'}
  element :submit_create_user, {id: 'vivino.web.app.beta:id/action_done'}
  element :accept, {id: 'android:id/button1'}
  element :country_in, {xpath: '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/'\
                'android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/androidx.appcompat.'\
                'widget.LinearLayoutCompat/android.widget.FrameLayout/android.widget.ListView//'\
                'android.widget.TextView[@text="India"]'}
  pseudo_element :pseudo_country_in, {xpath: '/hierarchy/android.widget.FrameLayout/android.widget.'\
                'LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/'\
                'androidx.appcompat.widget.LinearLayoutCompat/android.widget.FrameLayout/android.widget.ListView//'\
                'android.widget.TextView[@text="India"]'}
  element :create_acc_header, {xpath: '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/'\
                'android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.view.'\
                'ViewGroup/android.widget.TextView'}
  element :new_profile_header, {xpath: '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/'\
                'android.widget.FrameLayout/android.view.ViewGroup/android.widget.'\
                'FrameLayout[1]/android.view.ViewGroup/android.widget.TextView'}

  def initialize(driver)
    @driver = driver

    @email = EMAIL.dup
    @password = PASSWORD.dup
    @firstname = FIRSTNAME.dup
    @lastname = LASTNAME.dup
  end

  def create_user
    # fill-in the initial screen details
    input_email.send_keys(email)
    input_password.send_keys(password)
    next_button.click
    assert_text(new_profile_header, 'New Profile')

    # fill-in the new profile screen details
    input_firstname.send_keys(firstname)
    input_lastname.send_keys(lastname)
    select_country.click
    assert_text(select_country_title, 'Please Select Country')

    # swipe until an element is visible and click
    swipe_until(pseudo_country_in, 30)
    country_in.click

    submit_create_user.click
    accept.click
    submit_create_user.click
  end
end
