class CreateReturns < ActiveRecord::Migration
  def change
    create_table :returns do |t|
      t.integer :user_id
      t.text :reason
      t.integer :sale_id
      t.float :money_returned

      t.timestamps null: false
    end
  end
end
