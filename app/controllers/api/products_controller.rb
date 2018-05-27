class Api::ProductsController < ApplicationController
	def products_action
		@products = Product.all #array of products
		render "products_view.json.jbuilder"
	end
end
