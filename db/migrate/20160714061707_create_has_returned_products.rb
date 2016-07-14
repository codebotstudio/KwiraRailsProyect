class CreateHasReturnedProducts < ActiveRecord::Migration
  def change
    create_table :has_returned_products do |t|

      t.timestamps null: false
    end
  end
end
