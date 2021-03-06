class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :name, presence: true
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :admins, -> {where(permission_level: 'admin')}

end
