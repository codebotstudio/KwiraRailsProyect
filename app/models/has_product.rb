class HasProduct < ActiveRecord::Base
  belongs_to :sale
  belongs_to :product
  after_create :update_stock

  #after_create :update_stock
  def update_stock
  	product.units -= quantity
  	product.units = product.units.round(2)
  	product.save
  end
  private

 # def update_stock
 # 	solded = 1
 # 	product = Product.find(params[self.product_id])
 # 	stock = product.units
 # 	product.update_columns(units: (stock - solded)) 
 # end

end
