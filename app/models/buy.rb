class Buy < ActiveRecord::Base
  belongs_to :user

  scope :recientes, -> {order("created_at DESC")}
end
