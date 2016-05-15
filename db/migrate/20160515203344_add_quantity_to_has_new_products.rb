class AddQuantityToHasNewProducts < ActiveRecord::Migration
  def change
    add_column :has_new_products, :quantity, :float
  end
end
