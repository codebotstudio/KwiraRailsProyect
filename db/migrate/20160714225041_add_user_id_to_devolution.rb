class AddUserIdToDevolution < ActiveRecord::Migration
  def change
    add_reference :devolutions, :user, index: true, foreign_key: true
  end
end
