class UserMailer < ApplicationMailer
    default from: 'votre_adresse_email@votredomaine.com'
    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Bienvenue sur notre site !')
    end
end
