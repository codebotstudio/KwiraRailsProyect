class AddUserToDevolution < ActiveRecord::Migration
  def change
    remove_column :devolutions, :user_id
    remove_column :devolutions, :product_id
  end
end
