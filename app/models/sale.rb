class Sale < ActiveRecord::Base
  belongs_to :user
  after_create :save_product_id
  after_create :save_total
  has_many :has_product
  has_many :products, through: :has_product

  #Custom setter
  def product_id=(value)
  	@product_id = value
  end

  private

  def save_product_id
  	@product_id.each do |product_id|
  		HasProduct.create(product_id: product_id, sale_id: self.id)
  	end
  end

  def save_total
    item = 0
    total = 0
    self.products.each do |product|
      item += 1
      total += product.sale_price
    end
    self.items = item
    self.total_price = total
    self.save
  end

end
