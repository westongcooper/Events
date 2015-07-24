class Event < ActiveRecord::Base
  belongs_to :venue
  has_many :attendances, dependent: :destroy
  has_many :users, through: :attendances
  validates :name, presence: true
  validates :venue_id, presence: true
  # def make_admin
  #   Attendance.where(user_id:current_user.id).where(event_id:event.id).take
  # end
end
