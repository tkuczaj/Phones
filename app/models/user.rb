# frozen_string_literal: true

# Define user of the application
class User < ApplicationRecord
  has_secure_password

  validates :login, presence: { message: 'Musisz podać login użytkownika' }
  validates :login, format: {
    with: /\A[\d\-\w]{0,30}\z/,
    message: 'Możesz użyć liter, cyfr, kropki i myślnika. Maksymalnie 30 znaków.'
  }
  validates :email, presence: { message: 'Adres nie może być pusty' }
  validates :email, format: {
    with: /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/,
    message: 'Podaj poprawny adres email.'
  }
  validates :name, presence: { message: 'Podaj nazwę użytkownika' }
  validates :name, format: {
    with: /\A[\d\-[[:alnum:]]]{0,150}\z/,
    message: 'Możesz użyć liter, cyfr, kropki i myślnika.'
  }
end
