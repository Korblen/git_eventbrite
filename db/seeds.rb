# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
  User.all.each do |user|
    rand(1..5).times do  # Chaque utilisateur aura entre 1 et 5 événements
      Event.create!(
        title: Faker::Lorem.sentence(word_count: 3),
        description: Faker::Lorem.paragraph(sentence_count: 2),
        start_date: Faker::Date.forward(days: 23),
        duration: [30, 60, 90, 120].sample,  # Durée en minutes
        price: rand(1..100),  # Prix en devise de votre choix
        location: Faker::Address.city,
        user: user  # Assurez-vous que votre modèle Event a une association `belongs_to :user`
        # Ajoutez d'autres attributs nécessaires selon votre modèle Event
      )
    end
  end