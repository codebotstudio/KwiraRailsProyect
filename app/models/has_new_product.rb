class HasNewProduct < ActiveRecord::Base
  belongs_to :buy
  belongs_to :product
end
