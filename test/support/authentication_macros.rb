module AuthenticationMacros
  def login_user(user_properties = {})
    user = FactoryBot.create :user, user_properties
    visit login_path
    
    fill_in "login", with: user.login
    fill_in "password", with: user.password

    click_button "Zaloguj"

    user
  end

  def reset_login
    reset_session!
  end
end