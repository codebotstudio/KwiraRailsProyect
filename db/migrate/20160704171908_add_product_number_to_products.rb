class AddProductNumberToProducts < ActiveRecord::Migration
  def change
    add_column :products, :product_number, :integer
  end
end
