class Event < ActiveRecord::Base
  belongs_to :venue
  has_many :attendances, dependent: :destroy
  has_many :users, through: :attendances
  validates :name, presence: true
  validates :venue_id, presence: true
  # has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  # def make_admin
  #   Attendance.where(user_id:current_user.id).where(event_id:event.id).take
  # end
end
