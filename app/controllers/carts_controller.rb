class CartsController < ApplicationController
  before_action :set_cart, only: [:index]
  
  def index
    render json: @cart
  end
end