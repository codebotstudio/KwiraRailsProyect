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

  def make_has_new_products(product_ids, quantities)
    quantities.delete("")
    product_ids.each.with_index do |product_id, index|
      HasNewProduct.create(product_id: product_id, buy: self, quantity: quantities[index])
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

  private




end
