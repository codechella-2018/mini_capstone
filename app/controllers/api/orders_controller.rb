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

	  calculated_subtotal = @order.product.price * @order.quantity.to_i
	  calculated_tax = calculated_subtotal * 0.09
	  calulated_total = calculated_subtotal + calculated_tax

	  @order.update(
	  	subtotal: calculated_subtotal, 
	  	tax: calculated_tax, 
	  	total: calulated_total
	  )

	  render 'show.json.jbuilder'
	end
end





