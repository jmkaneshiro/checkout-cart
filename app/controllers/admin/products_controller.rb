class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
    render :index
  end

  def show
    @product = Product.find_by(id: params[:id])

    if @product
      render :show
    else
      redirect_to admin_products_url
    end
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_product_url(@product)
    else
      render :new 
    end
  end

  def edit
    @product = Product.find_by(id: params[:id])
    render :edit
  end

  def update
    @product = Product.find_by(id: params[:id])

    if @product.update_attributes(product_params)
      redirect_to admin_product_url(@product)
    else
      render :edit
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
