class AddKindToProducts < ActiveRecord::Migration
  def change
    add_column :products, :kind, :integer
  end
end
