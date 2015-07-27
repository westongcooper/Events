class User < ActiveRecord::Base
  has_many :attendances
  has_many :events, through: :attendances
  has_many :venues
  # has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :nickname, presence: true, uniqueness: true
  # validates :email, uniqueness: true, confirmation: true
  # validates :email_confirmation, presence: true
  # validates :password_digest, confirmation: true
  # validates :password_digest_confirmation, presence: true
  # has_secure_password

  def attending(event)
    attendances.where(event_id:event.id).count > 0
  end
  def has_events
    events.count != 0
  end
  def has_venues
    venues.count != 0
  end
end


