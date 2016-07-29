class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.text :address
      t.boolean :wholesale

      t.timestamps null: false
    end
  end
end
