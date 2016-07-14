class AddDetailToHasReturnedProducts < ActiveRecord::Migration
  def change
    add_column :has_returned_products, :return_id, :integer
    add_column :has_returned_products, :product_id, :integer
    add_column :has_returned_products, :quantity, :float
  end
end
