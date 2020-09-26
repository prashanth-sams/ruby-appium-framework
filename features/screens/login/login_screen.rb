# frozen_string_literal: true

class LoginScreen
  element :input_email, {id: 'vivino.web.app.beta:id/edtEmail'}
  element :input_password, {id: 'vivino.web.app.beta:id/edtPassword'}
  element :sign_in, {id: 'vivino.web.app.beta:id/action_signin'}
  element :header, {xpath: '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/'\
                'android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.'\
                'FrameLayout/android.widget.LinearLayout/android.view.ViewGroup/android.widget.TextView'}

  def initialize(driver)
    @driver = driver
  end
end
