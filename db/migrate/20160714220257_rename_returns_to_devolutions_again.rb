class RenameReturnsToDevolutionsAgain < ActiveRecord::Migration
  def change
  	rename_table :returns, :devolutions
  end
end
