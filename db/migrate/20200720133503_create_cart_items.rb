class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.integer :inventory_id
      t.integer :cart_id
      t.timestamps
    end
  end
end
