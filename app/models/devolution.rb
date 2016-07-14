class Devolution < ActiveRecord::Base
	belongs_to :user
	has_many :has_returned_product
	has_many :products, through: :has_returned_product

	def make_returned_products(product_ids, quantities)
		devuelto = 0
		quantities.delete("")
		product_ids.each.with_index do |product_id, index|
			HasReturnedProduct.create(product_id: product_id, devolution: self, quantity: quantities[index])
		end
		self.products.each do |prdct|
			a = HasReturnedProduct.where("devolution_id = ? AND product_id = ?", self, prdct).first
			b = Product.find(prdct)
			devuelto += (a.quantity * b.sale_price)
		end
		self.update_columns(money_returned: devuelto)
	end

	def toma_detalle(b)
    	a = HasReturnedProduct.where("devolution_id = ? AND product_id = ?", self, b).first
    	return a.quantity
  	end


end
