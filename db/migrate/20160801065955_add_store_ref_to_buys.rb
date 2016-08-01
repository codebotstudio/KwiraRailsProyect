class AddStoreRefToBuys < ActiveRecord::Migration
  def change
    add_reference :buys, :store, index: true, foreign_key: true
  end
end
