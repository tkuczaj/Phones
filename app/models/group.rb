# frozen_string_literal: true

# Define group of workers
class Group < ApplicationRecord
  has_many :workers, dependent: :destroy

  validates :name, presence: { message: 'Musisz podać nazwę grupy' }
  validates :name, format: {
    with: /\A[\d\-[[:alnum:]].]{0,150}\z/,
    message: 'Możesz użyć liter, cyfr, kropki i myślnika. Maksymalnie 200 znaków.'
  }
end
