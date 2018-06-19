class Product < ApplicationRecord

	has_many :category_products
	has_many :categories, through: :category_products

	belongs_to :supplier #return a supplier hash, assumes product has a foreign key (supplier_id)
	has_many :images

	has_many :carted_products
	has_many :orders, through: :carted_products

	def is_discounted?
		price < 10
	end

	def tax
		price * 0.09
	end

	def total
		price + tax
	end

end
