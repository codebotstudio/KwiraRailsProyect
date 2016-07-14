class HasReturnedProduct < ActiveRecord::Base
	belongs_to :devolution
	belongs_to :product
	after_create :update_stock

	def update_stock
		product.units += quantity

		product.save
	end
end
