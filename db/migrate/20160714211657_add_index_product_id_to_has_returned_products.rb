class AddIndexProductIdToHasReturnedProducts < ActiveRecord::Migration
  def change
  	add_index :has_returned_products, :product_id
  end
end
