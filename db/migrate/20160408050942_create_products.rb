class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :sale_title
      t.string :ticket_title
      t.float :sale_price
      t.float :buy_price
      t.float :units
      t.boolean :available
      t.text :description
      t.string :measurement_unit
      t.integer :product_type
      t.string :image

      t.timestamps null: false
    end
  end
end
