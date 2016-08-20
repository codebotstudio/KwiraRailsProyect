class Store < ActiveRecord::Base
	validates :name, presence: true
	validates :address, presence: true
	validates :phone, presence: true
	validates :wholesale, presence: true
end
