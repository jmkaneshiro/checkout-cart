class CartController < ApplicationController
  before_action :set_cart, only: [:index]
  
  def index
    render :index
  end
end