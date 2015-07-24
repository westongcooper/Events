class User < ActiveRecord::Base
  has_many :attendances
  has_many :events, through: :attendances
  has_many :venues
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true
  has_secure_password
end



