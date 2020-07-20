class CartItemsController < ApplicationController
  before_action :set_cart, only: [:create, :update, :destroy]

  def create
    @cart.add_cart_items(cart_item_params)
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

  private
  def cart_item_params
    params.require(:cart_item).permit(:product_id, :qty)
  end
end