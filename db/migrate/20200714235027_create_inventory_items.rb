class CreateInventoryItems < ActiveRecord::Migration[6.0]
  def change
    create_table :inventory_items do |t|
      t.integer :product_id
      t.boolean :purchased
      t.boolean :in_cart
      t.timestamps
    end
  end
end
