class EventMailer < ApplicationMailer
    default from: 'malo.bastianelli@gmail.com'

    # def event_created(event)
    #     @event = event
    #     mail(to: @event.users.email, subject: 'Votre événement a été créé !')
    # end

    def event_participation(user, event)
        @user = user
        @event = event
        mail(to: @event.user.email, subject: 'Nouvelle participation à votre événement !')
    end
    
end