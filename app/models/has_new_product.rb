class HasNewProduct < ActiveRecord::Base
  belongs_to :buy
  belongs_to :product
  after_create :update_stock

  scope :baratos, -> {order("buy_price ASC")}

  def get_buy_info
  	a = Buy.where(id: self.buy_id).first
  	return a.notes
  end

  def self.has_bought(product)
  	where(product_id: product)
  end

  def update_stock
 	#puts product.units.to_s
  	product.units += quantity
  	#puts product.units.to_s
  	product.save
  	#puts product.to_json
  end
end
