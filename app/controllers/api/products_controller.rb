class Api::ProductsController < ApplicationController
	def products_action
		@products = Product.all #array of products
		render "products_view.json.jbuilder"
	end

	def first_product_action
		@product = Product.first
		render "first_product_view.json.jbuilder"
	end

	def second_product_action
		@product = Product.second
		render "second_product_view.json.jbuilder"
	end

	def third_product_action
		@product = Product.third
		render "third_product_view.json.jbuilder"
	end
end
