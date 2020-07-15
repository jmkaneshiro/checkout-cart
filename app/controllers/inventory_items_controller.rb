class InventoryItemsController < ApplicationController
  def index
    @inventory_items = InventoryItem.all
    render :index
  end

  def show
    @inventory_item = InventoryItem.find_by(id: params[:id])

    if @inventory_item
      render json: @inventory_item
    else
      redirect_to inventory_items_url
    end
  end

  def create
    @inventory_item = InventoryItem.new(inventory_item_params)

    if @inventory_item.save
      redirect_to inventory_items_url
    else
      redirect_to product_url(inventory_item_params[:product_id])
    end
  end

  def destroy
    @inventory_item = InventoryItem.find(params[:id])
    if !@inventory_item.purchased && !@inventory_item.in_cart
      @inventory_item.destroy
    else
      flash[:errors] = ['Item purchased or in cart. Cannot be deleted.']
    end

    redirect_to inventory_items_url
  end

  private
  def inventory_item_params
    params.require(:inventory_item).permit(:product_id)
  end
end
