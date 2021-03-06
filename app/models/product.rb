# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :text
#  price       :decimal(19, 2)   not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
  validates :name, :price, presence: true

    has_many :inventory_items,
    foreign_key: :product_id,
    class_name: :InventoryItem 

    has_many :cart_items,
    through: :inventory_items
end
