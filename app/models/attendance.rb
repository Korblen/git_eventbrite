class Attendance < ApplicationRecord
  after_create :send_participation_email
  belongs_to :user
  belongs_to :event

  private

  def send_participation_email
    EventMailer.event_participation(self.user, self.event).deliver_now
  end
end
