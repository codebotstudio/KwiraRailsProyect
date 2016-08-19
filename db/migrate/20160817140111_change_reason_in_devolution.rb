class ChangeReasonInDevolution < ActiveRecord::Migration
  def change
  	change_column :devolutions, :reason, :integer
  end
end
