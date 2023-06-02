# frozen_string_literal: true

# Define group of workers
class Group < ApplicationRecord
  has_many :workers, dependent: :destroy

  validates :name, presence: { message: 'Group name required' }
  validates :name, format: {
    with: /\A[\d\-[[:alnum:]].]{0,150}\z/,
    message: 'Letters, numbers, dots and hyphens allowed. Maximum 200 characters.'
  }
end
