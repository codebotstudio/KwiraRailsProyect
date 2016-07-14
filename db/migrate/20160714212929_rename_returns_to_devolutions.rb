class RenameReturnsToDevolutions < ActiveRecord::Migration
  def change
   	rename_table :devolutions, :returns
  end
end
