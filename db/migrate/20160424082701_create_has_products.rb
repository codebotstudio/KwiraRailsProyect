class CreateHasProducts < ActiveRecord::Migration
  def change
    create_table :has_products do |t|
      t.references :sale, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
