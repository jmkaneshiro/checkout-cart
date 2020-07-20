class CartItemsController < ApplicationController
  before_action :set_cart, only: [:create, :update, :destroy]

  def create
    @cart.add_cart_items(product_id, qty)

    if @cart.save
      redirect_to cart_path
    else
      redirect_to @product
    end
  end

  def update
  end
  
  def destroy
  end
end