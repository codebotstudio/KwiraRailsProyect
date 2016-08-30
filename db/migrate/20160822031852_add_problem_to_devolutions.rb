class AddProblemToDevolutions < ActiveRecord::Migration
  def change
    add_column :devolutions, :problem, :text
  end
end
