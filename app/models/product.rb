class Product < ApplicationRecord

	def supplier
		Supplier.find(supplier_id)
	end

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
