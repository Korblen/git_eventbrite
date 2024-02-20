class Event < ApplicationRecord
    after_create :send_creation_email
    validates :start_date, presence: true
    validates :duration, numericality: { greater_than: 0, only_integer: true }
    validates :title, length: { in: 5..140 }
    validates :description, length: { in: 20..1000 }
    validates :price, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 1000 }
    validates :location, presence: true
    def event_created(event)
        @event = event
        mail(to: @event.admin.email, subject: 'Votre événement a été créé avec succès !')
    end
    def event_participation(user, event)
        @user = user
        @event = event
        mail(to: @event.admin.email, subject: 'Nouvelle participation à votre événement !')
    end
    private

    def send_creation_email
    EventMailer.event_created(self).deliver_now
    end
end