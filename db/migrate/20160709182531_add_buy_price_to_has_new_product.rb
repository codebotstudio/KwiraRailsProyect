class AddBuyPriceToHasNewProduct < ActiveRecord::Migration
  def change
    add_column :has_new_products, :buy_price, :float
  end
end
