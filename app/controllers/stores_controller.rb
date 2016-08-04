class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  # GET /devolutions
  # GET /devolutions.json
  def index
    @stores = Store.all
  end

  # GET /devolutions/1
  # GET /devolutions/1.json
  def show
  end

  def sales
    @store = Store.find(params[:id])
    @sales = Sale.all.where(store_id: @store).recientes.today
  end

  def history
    @store = Store.find(params[:id])
    @sales = Sale.all.where(store_id: @store).recientes.today
    @sales = Sale.all.where(store_id: @store).ventas_entre(params[:start], params[:finish]) if (params[:start] && params[:finish]).present?
  end

  def pending
    @store = Store.find(params[:id])
    @sales = Sale.all.where(store_id: @store).pendiente
  end

  def products
    @store = Store.find(params[:id])
    @products = Product.all.where(store_id: @store)
  end

  def inactive
    @store = Store.find(params[:id])
    @products = Product.all.inactivos.where(store_id: @store)
  end

  def critical
    @store = Store.find(params[:id])
    @products = Product.all.criticos.where(store_id: @store)
  end

  def buys
    @store = Store.find(params[:id])
    @buys = Buy.all.recientes.where(store_id: @store)
  end

  def users
    @store = Store.find(params[:id])
    @users = User.all.where(store_id: @store)
  end

  # GET /devolutions/new
  def new
    @store = Store.new
  end

  # GET /devolutions/1/edit
  def edit
  end

  # POST /devolutions
  # POST /devolutions.json
  def create
    @store = Store.new(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: 'store was successfully created.' }
        format.json { render :show, status: :created, location: @store }
      else
        format.html { render :new }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devolutions/1
  # PATCH/PUT /devolutions/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: 'store was successfully updated.' }
        format.json { render :show, status: :ok, location: @devolution }
      else
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devolutions/1
  # DELETE /devolutions/1.json
  def destroy
    @store.destroy
    respond_to do |format|
      format.html { redirect_to devolutions_url, notice: 'Store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:name, :wholesale, :address, :phone, :phone2)
    end
end
