# == Schema Information
#
# Table name: inventory_items
#
#  id         :bigint           not null, primary key
#  product_id :integer          not null
#  purchased  :boolean          default(FALSE)
#  in_cart    :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class InventoryItem < ApplicationRecord

  belongs_to :product,
    foreign_key: :product_id,
    class_name: :Product
  
  has_many :cart_items,
    foreign_key: :iventory_item_id,
    class_name: :CartItem
  
  delegate :id,
    :name,
    :description,
    :price,
    to: :product,
    prefix: true
end
