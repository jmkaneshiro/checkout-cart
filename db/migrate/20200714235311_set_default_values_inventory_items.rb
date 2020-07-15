class SetDefaultValuesInventoryItems < ActiveRecord::Migration[6.0]
  def change
    change_column_null :inventory_items, :product_id, false
    change_column_default :inventory_items, :purchased, false
    change_column_default :inventory_items, :in_cart, false
  end
end
