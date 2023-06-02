# frozen_string_literal: true

# Define user of the application
class User < ApplicationRecord
  has_secure_password

  validates :login, presence: { message: 'Login required' }
  validates :login, format: {
    with: /\A[\d\-\w]{0,30}\z/,
    message: 'Letters, numbers, dots and hyphens allowed. Maximum 30 characters.'
  }
  validates :email, presence: { message: 'Email required' }
  validates :email, format: {
    with: /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/,
    message: 'Incorrect email addres'
  }
  validates :name, presence: { message: 'User name required' }
  validates :name, format: {
    with: /\A[\d\-[[:alnum:]]]{0,150}\z/,
    message: 'Letters, numbers, dots and hyphens allowed. Maximum 150 characters.'
  }
end
