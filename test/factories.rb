FactoryBot.define do
  factory :user do |f|
    f.sequence(:login) { |n| "admin" }
    f.sequence(:email) { |n| "test{n}@kuczaj.net" }
    f.sequence(:name) { |n| "Użytkownik Testowy#{n}" }
    f.password { "admin" }
    f.password_confirmation { |d| d.password }
  end

  factory :group do |f|
    f.sequence(:name) { |n| "Pokój nr #{n}" }
  end

  factory :worker do |f|
    f.sequence(:name) { |n| "Pracownik nr #{n}" }
    f.association :group
  end
end