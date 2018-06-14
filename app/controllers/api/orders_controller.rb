class Api::OrdersController < ApplicationController
	def show
	  order_id = params[:id]
	  @order = Order.find(order_id)
	  render 'show.json.jbuilder'
	end

	def create
	  @order = Order.new(
	   user_id: current_user.id,
	   product_id: params[:product_id],
	   quantity: params[:quantity],
	   subtotal: params[:subtotal],
	   tax: params[:tax],
	   total: params[:total]
	  )

	  @order.save
	  render 'show.json.jbuilder'
	end
end
