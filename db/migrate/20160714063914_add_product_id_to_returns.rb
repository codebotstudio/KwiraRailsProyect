class AddProductIdToReturns < ActiveRecord::Migration
  def change
    add_column :returns, :product_id, :integer
  end
end
