class AddIndexToHasReturnedProducts < ActiveRecord::Migration
  def change
  	add_index :has_returned_products, :return_id
  end
end
