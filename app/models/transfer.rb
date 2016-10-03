class Transfer < ActiveRecord::Base
  belongs_to :user
  has_many :has_transfered_product
  has_many :products, through: :has_transfered_product

  scope :recientes, -> {order("updated_at DESC")}

   def make_transfered_products(product_ids, quantities, receiver)
    puts product_ids.to_json
    quantities.delete("")
    puts quantities.to_json
    product_ids.each.with_index do |product_id, index|
    HasTransferedProduct.create(product_id: product_id, transfer: self, receiver: receiver, quantity: quantities[index])
    end
  end

  def toma_detalle(b)
    a = HasTransferedProduct.where("transfer_id = ? AND product_id = ?", self, b).first
    return a.quantity
  end

end