class TransfersController < ApplicationController
	before_action :set_transfer, only: [:show, :edit, :update, :destroy]
  	before_action :authenticate_user!

	def index
		@stores = Store.all
		@transfers = Transfer.all.recientes
	end

	def new
		@transfer = Transfer.new
		@source = Store.find(params[:store_1])
		@receiver = Store.find(params[:store_2])
		@products = Product.all.where(store_id: @source).activos
	end

	def create
	  @transfer = Transfer.new(transfer_params)
      @transfer.make_transfered_products(params[:product_id], params[:quantity], @transfer.receiver)
    #@transfer.save
    #@transfer.save_total
	    respond_to do |format|
	      if @transfer.save
	        #@transfer.save_total
	        format.html { redirect_to @transfer, notice: 'transfer was successfully created.' }
	        format.json { render :show, status: :created, location: @transfer }
	      else
	        format.html { render :new }
	        format.json { render json: @transfer.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def show
		@transfer = Transfer.find(params[:id])
		@source = Store.find(@transfer.source)
		@receiver = Store.find(@transfer.receiver)
	end

  	private
    # Use callbacks to share common setup or constraints between actions.
	    def set_transfer
	      @transfer = Transfer.find(params[:id])
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def transfer_params
	      params.require(:transfer).permit(:user_id, :source, :receiver)
	    end

end