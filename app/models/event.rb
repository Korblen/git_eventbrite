class Event < ApplicationRecord
    # after_create :send_creation_email
    validates :start_date, presence: true
    validates :duration, numericality: { greater_than: 0, only_integer: true }
    validates :title, length: { in: 5..140 }
    validates :description, length: { in: 20..1000 }
    validates :price, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 1000 }
    validates :location, presence: true
    has_many :attendances
    has_many :users, through: :attendances
    belongs_to :admin, class_name: 'User', optional: true

    private

    # def send_creation_email
    # EventMailer.event_created(self).deliver_now
    # end
end