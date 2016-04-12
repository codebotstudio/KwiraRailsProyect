class Product < ActiveRecord::Base
	validates :sale_title, presence: true, uniqueness: true
	validates :ticket_title, presence: true, uniqueness: true
	validates :product_type, presence: true
	validates :buy_price, presence: true
	mount_uploader :image, PictureUploader
end
