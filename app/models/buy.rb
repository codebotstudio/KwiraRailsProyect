class Buy < ActiveRecord::Base
  belongs_to :user
#  after_create :save_product_id
#  after_create :update_stock
  has_many :has_new_product
  has_many :products, through: :has_new_product

  scope :recientes, -> {order("created_at DESC")}

  #Custom setter
  def product_id=(value)
    @product_id = value
  end

  def make_has_new_products(product_ids, quantities, buy_prices)
    quantities.delete("")
    buy_prices.delete("")
    product_ids.each.with_index do |product_id, index|
      HasNewProduct.create(product_id: product_id, buy: self, quantity: quantities[index], buy_price: buy_prices[index])
    end
  end

=begin
  def update_stock
    byebug 
  	@product_id.each do |product_id|
  		product = Product.find(product_id)
  		product.units += 1
      product.save
  	end
  end
=end
  
  def toma_detalle(b)
    a = HasNewProduct.where("buy_id = ? AND product_id = ?", self, b).first
    return a.quantity
  end

  def toma_costo(b)
    a = HasNewProduct.where("buy_id = ? AND product_id = ?", self, b).first
    return a.buy_price
  end

  private




end
