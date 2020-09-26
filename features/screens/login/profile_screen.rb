# frozen_string_literal: true

class ProfileScreen
  element :first_name, {id: 'vivino.web.app.beta:id/user_name'}
  element :profile_image, {id: 'vivino.web.app.beta:id/profile_image'}
  pseudo_element :pseudo_profile_image, {id: 'vivino.web.app.beta:id/profile_image'}
  element :my_wines, {id: 'vivino.web.app.beta:id/my_wines'}
  element :ratings, {id: 'vivino.web.app.beta:id/ratings'}
  element :wishlist, {id: 'vivino.web.app.beta:id/wishlist'}
  element :cellar, {id: 'vivino.web.app.beta:id/cellar'}
  element :sign_out_accept, {id: 'android:id/button1'}
  element :more_options, {xpath: '//android.widget.ImageView[@content-desc="More options"]'}
  element :sign_out, {xpath: '/hierarchy/android.widget.FrameLayout//android.widget.TextView'\
                '[@text="Sign Out"]'}
  pseudo_element :pseudo_sign_out, {xpath: '/hierarchy/android.widget.FrameLayout//'\
                'android.widget.TextView[@text="Sign Out"]'}
  element :settings, {xpath: '/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/'\
                'android.widget.ListView/android.widget.LinearLayout[1]/android.widget.LinearLayout'}
  element :settings_header, {xpath: '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/'\
                'android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[1]/android.view.'\
                'ViewGroup/android.widget.TextView'}
  element :header, {xpath: '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/'\
                'android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.'\
                'ViewGroup/android.widget.LinearLayout/android.view.ViewGroup/android.widget.TextView'}
  element :top_list_header, {xpath: '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/'\
                'android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.'\
                'ViewGroup/android.widget.LinearLayout/android.view.ViewGroup/android.widget.TextView'}

  def initialize(driver)
    @driver = driver
  end
end
