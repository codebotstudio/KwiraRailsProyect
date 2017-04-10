class Store < ActiveRecord::Base
	validates :name, presence: true
	validates :address, presence: true
	validates :phone, presence: true
	after_create :all_products

	def all_products
		products = Product.all.where(store_id: 1)
		products.each do |prd|
			a = prd.dup
			a.store_id = self.id
			a.save
		end
	end
end
