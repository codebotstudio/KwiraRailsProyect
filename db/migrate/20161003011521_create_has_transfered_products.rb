class CreateHasTransferedProducts < ActiveRecord::Migration
  def change
    create_table :has_transfered_products do |t|
      t.references :product, index: true, foreign_key: true
      t.references :transfer, index: true, foreign_key: true
      t.float :quantity

      t.timestamps null: false
    end
  end
end
