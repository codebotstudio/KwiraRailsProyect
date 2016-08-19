class DevolutionsController < ApplicationController
  before_action :set_devolution, only: [:show, :edit, :update, :destroy]

  # GET /devolutions
  # GET /devolutions.json
  def index
    @devolutions = Devolution.all.where(store_id: current_user.store_id).recientes
  end

  def search
    @sales = Sale.all.confirmadas.where(store_id: current_user.store_id).recientes.today
    @sales = Sale.all.confirmadas.where(store_id: current_user.store_id).ventas_entre(params[:start], params[:finish]) if (params[:start] && params[:finish]).present?
  end

  # GET /devolutions/1
  # GET /devolutions/1.json
  def show
  end

  # GET /devolutions/new
  def new
    @sale = Sale.find(params[:id])
    @devolution = Devolution.new
    @products = @sale.products
  end

  # GET /devolutions/1/edit
  def edit
  end

  # POST /devolutions
  # POST /devolutions.json
  def create
    @devolution = Devolution.new(devolution_params)
    if @devolution.reason == 1
      @devolution.make_returned_products(params[:product_id], params[:quantity])
    else
      @devolution.make_returned_without_stock(params[:product_id], params[:quantity])
    end

    respond_to do |format|
      if @devolution.save
        format.html { redirect_to @devolution, notice: 'devolution was successfully created.' }
        format.json { render :show, status: :created, location: @devolution }
      else
        format.html { render :new }
        format.json { render json: @devolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devolutions/1
  # PATCH/PUT /devolutions/1.json
  def update
    respond_to do |format|
      if @devolution.update(devolution_params)
        format.html { redirect_to @devolution, notice: 'devolution was successfully updated.' }
        format.json { render :show, status: :ok, location: @devolution }
      else
        format.html { render :edit }
        format.json { render json: @devolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devolutions/1
  # DELETE /devolutions/1.json
  def destroy
    @devolution.destroy
    respond_to do |format|
      format.html { redirect_to devolutions_url, notice: 'Devolution was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_devolution
      @devolution = Devolution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def devolution_params
      params.require(:devolution).permit(:user_id, :reason, :sale_id, :money_returned)
    end
end
