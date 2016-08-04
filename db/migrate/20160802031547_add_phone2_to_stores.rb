class AddPhone2ToStores < ActiveRecord::Migration
  def change
    add_column :stores, :phone2, :string
  end
end
