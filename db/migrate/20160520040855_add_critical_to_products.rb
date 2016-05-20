class AddCriticalToProducts < ActiveRecord::Migration
  def change
    add_column :products, :critical, :float
  end
end
