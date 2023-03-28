class Worker < ApplicationRecord
  belongs_to :group
  has_many :phones, dependent: :destroy

  def self.search(search)
		if search
			worker = Worker.where("name LIKE ?", "%" + search + "%")
			if worker
				self.where(id: worker)
			else
				Worker.all
			end
		else
			Worker.all
		end
	end

  validates :name, presence: { message: "Podaj nazwę pracownika"}, format: { with: /\A[\d\-[[:alnum:]] \.]{0,150}\z/, message: "Możesz użyć liter, cyfr, kropki i myślnika." }
end
