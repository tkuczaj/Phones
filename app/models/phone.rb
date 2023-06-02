# frozen_string_literal: true

# Define phone number used in the application
class Phone < ApplicationRecord
  belongs_to :worker

  validates :number, presence: { message: 'Phone number required' }
  validates :number, format: { with: /\A\+{0,1}[\d()\-\w #]{0,30}\z/, message: 'Incorrect number format' }
end
