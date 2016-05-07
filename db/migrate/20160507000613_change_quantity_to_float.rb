class ChangeQuantityToFloat < ActiveRecord::Migration
  def change
  	change_column :has_products, :quantity, :float
  end
end
