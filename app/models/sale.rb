class Sale < ActiveRecord::Base
  belongs_to :user
  after_save :save_total
  has_many :has_product
  has_many :products, through: :has_product

  def make_has_products(product_ids, quantities)
    puts product_ids.to_json
    quantities.delete("")
    puts quantities.to_json
    product_ids.each.with_index do |product_id, index|
      puts "lalalala"+index.to_s
      puts "lalalalal"+product_ids[index]
      puts "lalalala"+quantities[index]
      HasProduct.create(product_id: product_id, sale: self, quantity: quantities[index])
    end
  end

  private
  def save_total
    item = 0
    total = 0
    self.products.each do |product|
      item += 1
      total += product.sale_price
    end
    self.update_columns(items: item)
    self.update_columns(total_price: total)
  end

end
