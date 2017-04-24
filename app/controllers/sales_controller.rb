class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  #after_action :set_sale_params, only: [:create]

  # GET /sales
  # GET /sales.json
  def index
    if current_user.permission_level == "1"
      @sales = Sale.all.where(store_id: current_user.store_id).venta_trabajador(current_user).recientes.today
      @devolutions = Devolution.all.where(store_id: current_user.store_id).devolucion_trabajador(current_user).recientes.today
    else
      @sales = Sale.all.where(store_id: current_user.store_id).recientes.today
      @devolutions = Devolution.all.where(store_id: current_user.store_id).recientes.today
    end
    # No funciona @sales = Sale.hoy
  end

  def history
    @sales = Sale.all.where(store_id: current_user.store_id).recientes.today
    @devolutions = Devolution.all.where(store_id: current_user.store_id).recientes.today

    @sales = Sale.all.recientes.where(store_id: current_user.store_id).ventas_entre(params[:start], params[:finish]) if (params[:start] && params[:finish]).present?
    @devolutions = Devolution.all.recientes.where(store_id: current_user.store_id).devoluciones_entre(params[:start], params[:finish]) if (params[:start] && params[:finish]).present?
  end

  def by_ticket
    @sales = nil
    @sales = Sale.all.where(ticket_id: params[:number]) if (params[:number]).present?
  end

  def pending
    @sales = Sale.all.where(store_id: current_user.store_id).pendiente
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
   @sale = Sale.find(params[:id])
   @store = Store.find(@sale.store_id)
  end

  # GET /sales/new
  def new
    @sale = Sale.new
    @products = Product.all.where(store_id: current_user.store_id).activos
  end

  # GET /sales/1/edit
  def edit
    @sale = Sale.find(params[:id])
    @products = Product.all.where(store_id: @sale.store_id).activos
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)
    if @sale.wholesale == true
      @sale.make_wholesale_products(JSON.parse(params[:product_id]), JSON.parse(params[:quantity]))
    else
      @sale.make_has_products(JSON.parse(params[:product_id]), JSON.parse(params[:quantity]))
    end
    #@sale.save
    #@sale.save_total
    respond_to do |format|
      if @sale.save
        #@sale.save_total
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
        format.js {render js: "window.location = '#{sales_path}';"}
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:user_id, :total_price, :items, :pending, :store_id, :wholesale)
    end

  #  def sale_params
  #    params.require(:sale).permit(:user_id, :total_price, :items, :pending, :store_id)
  #  end
end
