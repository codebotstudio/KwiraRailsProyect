class ProductsController < ApplicationController

	before_action :authenticate_user!, except: [:show, :index, :list]
	#A esta ruta se accede cn el verbo GET y el path "/products"
	def index
		#Variables con @ son variables de clase y se pueden acceder desde la vista y el controlador, sin @ son inaccesibles para la vista
		@products = Product.all.activos
	end


	def inactive
		@products = Product.all.inactivos
	end

	def critical
		@products = Product.all.criticos
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

	def list
		@products = Product.all
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

	def send_critical
		@products = Product.all.criticos
		ProductMailer.critical_quantities(@products).deliver
		redirect_to products_critical_path
	end



	private

	def validate_user 
		redirect_to new_user_session_path, notice: "Inicia sesión para completar la acción"
	end


	def product_params
		params.require(:product).permit(:sale_title, :ticket_title, :sale_price, :buy_price, :units, :description, :measurement_unit, :product_type, :image, :critical, :active, :product_number, :kind)
	end

end