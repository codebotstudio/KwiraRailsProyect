class AddDevolutionReferenceToHasReturnedProduct < ActiveRecord::Migration
  def change
    add_reference :has_returned_products, :devolution, index: true, foreign_key: true
  end
end
