class AddWholesaleToSales < ActiveRecord::Migration
  def change
    add_column :sales, :wholesale, :boolean
  end
end
