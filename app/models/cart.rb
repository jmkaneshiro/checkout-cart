# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cart < ApplicationRecord
  has_many :cart_items,
    foreign_key: :cart_id,
    class_name: :CartItem

  def add_cart_items(cart_item_params)
    avail_items = InventoryItem.where(product_id: cart_item_params[:product_id], purchased: false, in_cart: false)
    cart_items_count = 0
    avail_items.each do |item|
      Cart.transaction do
        item.update(in_cart: true)
        CartItem.create(cart_id: self.id, inventory_item_id: item.id)
      end
      cart_items_count += 1
      if cart_items_count == cart_item_params[:qty].to_i
        break
      end
    end
  end

  def cart_total_value(cart_items)
    total = 0

    cart_items.each do |item|
      total += item.product_price
    end

    total
  end

  def product_qty(cart_items)
    product_counts = Hash.new(0)

    cart_items.each do |item|
      product_counts[item.product_id] += 1
    end
  end

  def product_subtotal(product, qty)
    product.price * qty
  end
end
