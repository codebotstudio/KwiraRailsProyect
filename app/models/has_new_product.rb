class HasNewProduct < ActiveRecord::Base
  belongs_to :buy
  belongs_to :product
  after_create :update_stock

  def update_stock
 	#puts product.units.to_s
  	product.units += quantity
  	#puts product.units.to_s
  	product.save
  	#puts product.to_json
  end
end
