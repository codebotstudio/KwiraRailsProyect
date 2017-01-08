class AddTicketIdToSales < ActiveRecord::Migration
  def change
    add_column :sales, :ticket_id, :string
  end
end
