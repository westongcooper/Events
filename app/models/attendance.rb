class Attendance < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  # def make_admin
  #   Attendance.where(user_id:current_user.id).where(event_id:event.id).take
  # end
end
