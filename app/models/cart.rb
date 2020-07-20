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

  def add_cart_items(product_id, qty)
    avail_items = InventoryItem.where(product_id: product_id, purchased: false, in_cart: false)
    cart_items_count = 0

    until cart_items_count == qty
      avail_items.each do |item|
        Cart.transaction do
          item.update(in_cart: true)
          CartItem.create(cart_id: self.id, inventory_item_id: item.id)
        end
        cart_items_count += 1
      end
    end
  end
end
