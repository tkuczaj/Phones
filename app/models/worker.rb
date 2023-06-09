# frozen_string_literal: true

# Define worker
class Worker < ApplicationRecord
  belongs_to :group
  has_many :phones, dependent: :destroy

  def self.search(search)
    if search
      worker = Worker.where('name LIKE ?', "%#{search}%")
      if worker
        where(id: worker)
      else
        Worker.all
      end
    else
      Worker.all
    end
  end

  validates :name, presence: {
    message: 'Entry name required'
  }, format: {
    with: /\A[\d\-[[:alnum:]] ]{0,150}\z/, message: 'Letters, numbers, dots and hyphens allowed. Maximum 150 characters.'
  }
end
