class ApplicationController < ActionController::Base
  before_action :set_cart
  helper_method :current_cart
  private
  def set_cart
    # For testing purposes: set cart to always equal 1
    @cart = Cart.find(1)
  end

  def current_cart
    if !session[:cart_id].nil?
      Cart.find(session[:cart_id])
    end
  end
end
