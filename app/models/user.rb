class User < ActiveRecord::Base
  has_many :attendances
  has_many :events, :through => :attendances
  has_many :venues
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_secure_password

end



