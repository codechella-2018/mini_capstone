class Order < ApplicationRecord
	belongs_to :user
	belongs_to :product

	def friendly_created_at
		created_at.strftime("%b %e, %l:%M %p")
	end
end
