class Sale < ActiveRecord::Base
  belongs_to :user
#  after_save :save_total
  has_many :has_product
  has_many :products, through: :has_product

  after_create :set_sale_id

#<<<<<<< HEAD
  #scope :high_sale, -> {order("total_price DESC").limit(10)}

  scope :today, -> {where("updated_at >= ?", Time.zone.now.beginning_of_day)}
  # Arreglar metodos TODAY
  #scope :hoy, -> { where(created_at: Date.today) }
  scope :pendiente, -> {where(pending: true)}
  scope :confirmadas, -> {where(pending: false)}
  scope :recientes, -> {order("updated_at DESC")}


  # SCOPE listo y funcionando
  def self.venta_trabajador(user)
    where(user_id: user.id)
  end

  def self.ventas_entre(start, finish)
    where(updated_at: start.to_date.beginning_of_day..finish.to_date.end_of_day)
  end

  def set_sale_id
    store = self.store_id
    employee = self.user_id
    number = self.id
    ticket_number = sprintf("%02d", store) + sprintf("%02d", employee) + sprintf("%06d", number)
    self.update_columns(ticket_id: ticket_number)
  end


  def make_has_products(product_ids, quantities)
    item = 0
    total = 0
    puts product_ids.to_json
    quantities.delete("")
    puts quantities.to_json
    product_ids.each.with_index do |product_id, index|
      HasProduct.create(product_id: product_id, sale: self, quantity: quantities[index])
    end
    self.products.each do |prdct|
      item += 1
      a = HasProduct.where("sale_id = ? AND product_id = ?", self, prdct).first
      b = Product.find(prdct)
      total += (a.quantity * b.sale_price)
    end
    self.update_columns(total_price: total, items: item)
  end

  def make_wholesale_products(product_ids, quantities)
    item = 0
    total = 0
    puts product_ids.to_json
    quantities.delete("")
    puts quantities.to_json
    product_ids.each.with_index do |product_id, index|
      HasProduct.create(product_id: product_id, sale: self, quantity: quantities[index])
    end
    self.products.each do |prdct|
      item += 1
      a = HasProduct.where("sale_id = ? AND product_id = ?", self, prdct).first
      b = Product.find(prdct)
      total += (a.quantity * b.wholesale_price)
    end
    self.update_columns(total_price: total, items: item)
  end

# Según yo esto esta bien
  def save_total
    item = 0
    total = 0
    self.products.each do |prdct|
      item += 1
      a = HasProduct.where("sale_id = ? AND product_id = ?", self, prdct).first
      b = Product.find(prdct)
      total += (a.quantity * b.sale_price)
    end
    self.total_price = total
    self.items = item
    self.update_columns(total_price: total, items: item)
  end

  def toma_detalle(b)
    a = HasProduct.where("sale_id = ? AND product_id = ?", self, b).first
    return a.quantity
  end
  
  private

end
