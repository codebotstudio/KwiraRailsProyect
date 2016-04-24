class Product < ActiveRecord::Base
	validates :sale_title, presence: true, uniqueness: true
	validates :ticket_title, presence: true, uniqueness: true
	validates :product_type, presence: true
	validates :buy_price, presence: true
	mount_uploader :image, PictureUploader

	def filter_type(type)
		if type == 1
			@productos = Product.all.where(params[:product_type] == 1)
		elsif type == 2
			@productos = Product.all.where(params[:product_type] == 2)
		elsif type == 3
			@productos = Product.all.where(params[:product_type] == 3)
		else
			@productos = Product.all		
		end
	end
end
