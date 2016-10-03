class AddReceiverToHasTransferedProduct < ActiveRecord::Migration
  def change
    add_column :has_transfered_products, :receiver, :integer
  end
end
