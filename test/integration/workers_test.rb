require "test_helper"

class WorkersTest < ActionDispatch::IntegrationTest
  test "Można wyświetlić pracownika z fabryki" do
    user = login_user name: "Testowy Zenek"
    worker = FactoryBot.create :worker
    visit root_path
    assert_text worker.name
  end
end