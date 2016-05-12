class Product < ActiveRecord::Base
	validates :sale_title, presence: true, uniqueness: true
	validates :ticket_title, presence: true, uniqueness: true
	validates :product_type, presence: true
	validates :buy_price, presence: true
	mount_uploader :image, PictureUploader

	scope :quimicos, -> { where(product_type: 1)}

	scope :jarcieria, -> {where(product_type: 2)}

	scope :otros, -> {where(product_type: 3)}

	scope :nuevos, -> {order("created_at DESC").limit(5)}
=begin
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
=end
end
