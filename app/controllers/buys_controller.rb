class BuysController < ApplicationController
  before_action :set_buy, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /buys
  # GET /buys.json
  def index
    @buys = Buy.all.recientes.where(store_id: current_user.store_id)
  end

  def list_product
    @store = Store.find(current_user.store_id)
    @store = Store.find(params[:id]) if (params[:id]).present?
    @products = Product.all.activos.where(store_id: @store)
  end

  def product_record
    @product = Product.find(params[:id])
    @buys = HasNewProduct.has_bought(@product).baratos
  end

  # GET /buys/1
  # GET /buys/1.json
  def show
    @buy = Buy.find(params[:id])
    @store = Store.find(@buy.store_id)
  end

  # GET /buys/new
  def new
    @store = Store.find(current_user.store_id)
    @store = Store.find(params[:id]) if (params[:id]).present?
    @buy = Buy.new
    @products = Product.all.where(store_id: @store)
  end

  # GET /buys/1/edit
  def edit
    @products = Product.all.where(store_id: current_user.store_id)
  end

  # POST /buys
  # POST /buys.json
  def create
    @buy = Buy.new(buy_params)
    @buy.make_has_new_products(params[:product_id], params[:quantity], params[:buy_price])
    respond_to do |format|
      if @buy.save
        format.html { redirect_to @buy, notice: 'Buy was successfully created.' }
        format.json { render :show, status: :created, location: @buy }
      else
        format.html { render :new }
        format.json { render json: @buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buys/1
  # PATCH/PUT /buys/1.json
  def update
    respond_to do |format|
      if @buy.update(buy_params)
        format.html { redirect_to @buy, notice: 'Buy was successfully updated.' }
        format.json { render :show, status: :ok, location: @buy }
      else
        format.html { render :edit }
        format.json { render json: @buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buys/1
  # DELETE /buys/1.json
  def destroy
    @buy.destroy
    respond_to do |format|
      format.html { redirect_to buys_url, notice: 'Buy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buy
      @buy = Buy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def buy_params
      params.require(:buy).permit(:user_id, :items, :notes, :product_id, :store_id)
    end
end
