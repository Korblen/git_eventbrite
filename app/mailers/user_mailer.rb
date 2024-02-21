class UserMailer < ApplicationMailer
    default from: 'malo.bastianelli@gmail.com'
    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Bienvenue sur notre site !')
    end
end
