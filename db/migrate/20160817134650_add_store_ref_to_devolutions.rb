class AddStoreRefToDevolutions < ActiveRecord::Migration
  def change
    add_reference :devolutions, :store, index: true, foreign_key: true
  end
end
