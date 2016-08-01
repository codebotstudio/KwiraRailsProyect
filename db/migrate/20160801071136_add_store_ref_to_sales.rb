class AddStoreRefToSales < ActiveRecord::Migration
  def change
    add_reference :sales, :store, index: true, foreign_key: true
  end
end
