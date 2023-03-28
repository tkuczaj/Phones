class Phone < ApplicationRecord
  belongs_to :worker

  validates :number, presence: { message: "Podaj numer telefonu"}, format: { with: /\A\+{0,1}[\d\(\)\-\w \.#]{0,30}\z/, message: "Niepoprawny format numeru" }
end
