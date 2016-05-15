class AddProductRefToBuys < ActiveRecord::Migration
  def change
    add_reference :buys, :product, index: true, foreign_key: true
  end
end
