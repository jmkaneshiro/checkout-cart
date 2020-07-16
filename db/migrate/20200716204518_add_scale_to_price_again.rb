class AddScaleToPriceAgain < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :price, :decimal, precision: 19, scale: 2
  end
end
