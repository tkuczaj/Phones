require "test_helper"

class GroupsTest < ActionDispatch::IntegrationTest
  test "Home page works" do
    visit root_path

    assert_selector "h1", text: "Spis telefonów"
  end

  test "Login page works" do
    visit login_path

    assert_selector "h1", text: "Zaloguj użytkownika systemu"
  end

  test "Tylko zalogowany użytkownik może manipulować grupami" do
    user = login_user name: "Testowy Zenek"

    click_on "Dodaj grupę"
    group = FactoryBot.create :group
    visit root_path
    assert_text group.name
    assert_text "Zmień nazwę wydziału"
    click_on "Wyloguj"
    visit root_path
    assert_text group.name
    refute page.has_content?("Wyloguj")
    refute page.has_content?("Zmień nazwę wydziału")
  end
end