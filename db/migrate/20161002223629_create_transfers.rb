class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.references :user, index: true, foreign_key: true
      t.references :products, index: true, foreign_key: true
      t.integer :source
      t.integer :receiver

      t.timestamps null: false
    end
  end
end
