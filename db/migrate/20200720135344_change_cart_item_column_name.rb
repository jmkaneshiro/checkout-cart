class ChangeCartItemColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :cart_items, :inventory_id, :inventory_item_id
  end
end
