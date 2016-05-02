class AddQuantityToHasProducts < ActiveRecord::Migration
  def change
    add_column :has_products, :quantity, :integer
  end
end
