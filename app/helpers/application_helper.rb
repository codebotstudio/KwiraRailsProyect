module ApplicationHelper
	def filter_type(type)
		if type == 1
			@products = Product.all.where(params[:product_type] == 1)
		elsif type == 2
			@products = Product.all.where(params[:product_type] == 2)
		elsif type == 3
			@products = Product.all.where(params[:product_type] == 3)
		else
			@products = Product.all		
		end
	end
end
