class AddProductsToDevolutions < ActiveRecord::Migration
  def change
    add_reference :devolutions, :product, index: true, foreign_key: true
  end
end
