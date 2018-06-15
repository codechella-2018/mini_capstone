class Api::OrdersController < ApplicationController
	def show
	  order_id = params[:id]
	  @order = Order.find(order_id)
	  render 'show.json.jbuilder'
	end

	def create
		#subtotal = products price * order qty

	  @order = Order.create(
	   user_id: current_user.id,
	   product_id: params[:product_id],
	   quantity: params[:quantity]
	  )

	  @order.update(
	  	subtotal: @order.calculated_subtotal,
	  	tax: @order.calculated_tax, 
	  	total: @order.calulated_total
	  )

	  render 'show.json.jbuilder'
	end
end





