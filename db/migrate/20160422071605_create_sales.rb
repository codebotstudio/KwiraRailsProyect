class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :user, index: true, foreign_key: true
      t.decimal :total_price
      t.integer :items
      t.boolean :pending

      t.timestamps null: false
    end
  end
end
