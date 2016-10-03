class HasTransferedProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :transfer
  after_create :update_stocks

  def update_stocks
  	a = product.product_number
  	product.units -= quantity
  	product.units = product.units.round(2)
  	product.save
  	b = Product.where(store_id: self.receiver, product_number: product.product_number).first
  	b.units += quantity
  	b.units = b.units.round(2)
  	b.save
  end
end
