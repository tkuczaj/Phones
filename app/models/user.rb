class User < ApplicationRecord
 	has_secure_password

	validates :login, presence: { message: "Musisz podać login użytkownika"}, format: { with: /\A[\d\-\w \.]{0,30}\z/, message: "Możesz użyć liter, cyfr, kropki i myślnika. Maksymalnie 30 znaków." }
	validates :email, presence: { message: "Adres nie może być pusty"}, format: { with: /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/, message: "Podaj poprawny adres email." }
	validates :name, presence: { message: "Podaj nazwę użytkownika"}, format: { with: /\A[\d\-[[:alnum:]] \.]{0,150}\z/, message: "Możesz użyć liter, cyfr, kropki i myślnika." }
end
