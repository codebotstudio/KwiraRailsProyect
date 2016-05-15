class CreateHasNewProducts < ActiveRecord::Migration
  def change
    create_table :has_new_products do |t|
      t.references :buy, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
