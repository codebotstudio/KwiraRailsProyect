class CreateBuys < ActiveRecord::Migration
  def change
    create_table :buys do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :items
      t.text :notes

      t.timestamps null: false
    end
  end
end
