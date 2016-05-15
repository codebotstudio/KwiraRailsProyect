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
    puts product_ids.to_json
    quantities.delete("")
    puts quantities.to_json
    product_ids.each.with_index do |product_id, index|
      puts "lalalala"+index.to_s
      puts "lalalalal"+product_ids[index]
      puts "lalalala"+quantities[index]
      HasNewProduct.create(product_id: product_id, buy: self, quantity: quantities[index])
    end
    
#>>>>>>> sale-quantities
  end

  private

=begin
  def update_stock
  	@product_id.each do |product_id|
  		@product = Product.find(product_id)
  		@product.units += 1
  	end
  end
=end

end
