class Sale < ActiveRecord::Base
  belongs_to :user
  after_create :save_product_id
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
end
