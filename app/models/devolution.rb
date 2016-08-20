class Devolution < ActiveRecord::Base
	belongs_to :user
	has_many :has_returned_product
	has_many :products, through: :has_returned_product

	scope :recientes, -> {order("created_at DESC")}

	def make_returned_products(product_ids, quantities)
		mayoreo = Sale.find(self.sale_id).wholesale
		devuelto = 0
		quantities.delete("")
		product_ids.each.with_index do |product_id, index|
			HasReturnedProduct.create(product_id: product_id, devolution: self, quantity: quantities[index]).update_stock
		end
		self.products.each do |prdct|
			a = HasReturnedProduct.where("devolution_id = ? AND product_id = ?", self, prdct).first
			b = Product.find(prdct)
			if mayoreo
				devuelto += (a.quantity * b.wholesale_price)
			else
				devuelto += (a.quantity * b.sale_price)
			end
		end
		self.update_columns(money_returned: devuelto)
	end

	def make_returned_without_stock(product_ids, quantities)
		mayoreo = Sale.find(self.sale_id).wholesale
		devuelto = 0
		quantities.delete("")
		product_ids.each.with_index do |product_id, index|
			HasReturnedProduct.create(product_id: product_id, devolution: self, quantity: quantities[index])
		end
		self.products.each do |prdct|
			a = HasReturnedProduct.where("devolution_id = ? AND product_id = ?", self, prdct).first
			b = Product.find(prdct)
			if mayoreo
				devuelto += (a.quantity * b.wholesale_price)
			else
				devuelto += (a.quantity * b.sale_price)
			end
		end
		self.update_columns(money_returned: devuelto)
	end

	def toma_detalle(b)
    	a = HasReturnedProduct.where("devolution_id = ? AND product_id = ?", self, b).first
    	return a.quantity
  	end


end
