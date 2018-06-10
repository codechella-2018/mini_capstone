class Supplier < ApplicationRecord
	has_many :products #return a products array, assumes product has a foreign key (supplier_id)
end
 