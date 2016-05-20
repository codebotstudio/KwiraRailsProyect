class AddScheduleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :schedule, :integer
  end
end
