class ProductsController < ApplicationController
	#A esta ruta se accede cn el verbo GET y el path "/products"
	def index
		#Variables con @ son variables de clase y se pueden acceder desde la vista y el controlador, sin @ son inaccesibles para la vista
		@products = Product.all
	end

	# A esta ruta se accede con el verbo GET y el path "/products/:id"
	def show
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new
	end

	def edit
		@product = Product.find(params[:id])
	end

	# A esta ruta se accede con POST a /products
	def create
		#@product = product.new(title: params[:product][:title], body: params[:product][:body])

		#@product = Product.new(params[:product])
		@product = Product.new(product_params)

		# Aqui podemos utilizar esto para las validaciones
		# if @product.invalid?

		# Para guardar en la base de datos basta con .save
		if @product.save
			redirect_to @product
		else
			render :new
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy #Elimina el objeto de la base de datos
		redirect_to products_path
	end

	# A esta ruta se accede con PUT /products/:id
	def update
		#@product.update_attributes({title: 'Nuevo titulo'})
		@product = Product.find(params[:id])
		if @product.update(product_params)
			redirect_to @product
		else
			render :edit
		end
	end

	private

	def product_params
		params.require(:product).permit(:sale_title, :ticket_title, :sale_price, :buy_price, :units, :description, :measurement_unit, :product_type, :image)
	end

end