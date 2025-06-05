require 'faker'

#rails db:drop db:create db:migrate db:seed
#💬 Useful Console Commands
#You can test your database from the Rails console:

#ruby
#Copier
#Modifier
#Dog.first.dogsitters
#Dogsitter.last.strolls
#City.find(1).dogs.count
#Stroll.all.map { |s| "#{s.dogsitter.first_name} walks #{s.dog.name}" }

puts "🌪️ Nettoyage de la base..."
Stroll.destroy_all
Dog.destroy_all
Dogsitter.destroy_all
City.destroy_all

puts "🏙️ Création des villes..."
cities = 5.times.map do
  City.create!(name: Faker::Address.city)
end

puts "🦴 Création des chiens..."
dogs = 10.times.map do
  Dog.create!(
    name: Faker::Creature::Dog.name,
    city: cities.sample
  )
end

puts "🧍 Création des dogsitters..."
dogsitters = 10.times.map do
Dogsitter.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  city: cities.sample
)
end

puts "🚶 Création des promenades (strolls)..."
20.times do
  Stroll.create!(
    date: Faker::Time.forward(days: 15, period: :day),
    dogsitter: dogsitters.sample,
    dog: dogs.sample,
  )
end

puts "✅ Seed terminé avec succès !"

puts "#{City.count} villes 🏙️ créées"
puts "#{Dogsitter.count} dogsitters disponibles 🧍"
puts "#{Dog.count} chiens enregistrés 🐕"
puts "#{Stroll.count} promenades programmées 🚶"
