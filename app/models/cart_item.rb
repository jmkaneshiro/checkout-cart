# == Schema Information
#
# Table name: cart_items
#
#  id           :bigint           not null, primary key
#  inventory_id :integer
#  cart_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class CartItem < ApplicationRecord
  belongs_to :cart,
    foreign_key: :cart_id,
    class_name: :Cart
  
  belongs_to :inventory_item,
    foreign_key: :inventory_item_id,
    class_name: :InventoryItem

  has_one :product,
  through: :inventory_item

  delegate :id,
  :name,
  :description,
  :price,
  to: :product,
  prefix: true
end
