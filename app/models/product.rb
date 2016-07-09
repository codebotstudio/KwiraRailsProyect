class Product < ActiveRecord::Base
	validates :sale_title, presence: true, uniqueness: true
	validates :ticket_title, presence: true, uniqueness: true
	validates :product_type, presence: true
	validates :measurement_unit, presence: true
	validates :buy_price, presence: true
	validates :units, presence: true
	validates :product_number, presence: true
	validates :sale_price, presence: true

	mount_uploader :image, PictureUploader

	scope :quimicos, -> { where(product_type: 1)}

	scope :jarcieria, -> {where(product_type: 2)}

	scope :otros, -> {where(product_type: 3)}

	scope :nuevos, -> {order("created_at DESC").limit(5)}

	scope :activos, -> {where(active: true)}

	scope :inactivos, -> {where(active: false)}

	scope :criticos, -> {where("units <= critical")}



	
end
