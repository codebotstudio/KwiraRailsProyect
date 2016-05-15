class Buy < ActiveRecord::Base
  belongs_to :user
  after_create :save_product_id
#  after_create :update_stock
  has_many :has_new_product
  has_many :products, through: :has_new_product

  scope :recientes, -> {order("created_at DESC")}

  #Custom setter
  def product_id=(value)
    @product_id = value
  end

  private

  def save_product_id
  	@product_id.each do |product_id|
  		HasNewProduct.create(product_id: product_id, buy_id: self.id)
  	end
  end

=begin
  def update_stock
  	@product_id.each do |product_id|
  		@product = Product.find(product_id)
  		@product.units += 1
  	end
  end
=end

end
