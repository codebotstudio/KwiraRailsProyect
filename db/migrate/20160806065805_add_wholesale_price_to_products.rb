class AddWholesalePriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :wholesale_price, :float
  end
end
