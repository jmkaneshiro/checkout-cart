class OrdersController < ApplicationController
  def new
    @cart = current_cart
    if @cart.cart_items.empty?
      flash[:alert] = "Your cart is empty"
      redirect_to cart_path
    else
      render :new
    end
  end

  def create
    @order = Order.new(order_params)
    Order.transaction do
      # inventory_items => purchased:true
      # inventory_items => in_cart:false
      # reset cart_id in session
      # save order
      @order.cart.cart_items.each do |cart_item|
      cart_item.inventory_item.update(purchased: true, in_cart: false)
      end
      session[:cart_id] = nil
      @cart = nil
      @order.save
    end

    redirect_to root_path
  end

  def update
  end

  private
  def order_params
    params.require(:order).permit(:cart_id)
  end
end