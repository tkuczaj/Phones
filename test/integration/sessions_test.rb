require "test_helper"

class SessionTest < ActionDispatch::IntegrationTest
  test "Użytkownik może się zalogować" do 
    user = FactoryBot.create :user
    
    visit root_path

    click_on "Zaloguj"

    fill_in "login", with: "admin"
    fill_in "password", with: "admin"

    click_button "Zaloguj"

    assert_text "Zalogowany jako"
  end

  test "Użytkownik nie może się zalogować z błędnym hasłem" do
    visit root_path

    click_on "Zaloguj"

    fill_in "login", with: "admin"
    fill_in "password", with: "ziutek"

    click_button "Zaloguj"

    assert_text "Nieprawidłowa nazwa użytkownika"
    refute page.has_content?("Wyloguj")
  end

  test "Użytkownik może się wylogować" do
    login_user name: "Zenon Kowalski"

    visit root_path
    assert_text "Zenon Kowalski"

    click_on "Wyloguj"

    assert_text "Wylogowano użytkownika"
    refute page.has_content?("Wyloguj")
  end
end