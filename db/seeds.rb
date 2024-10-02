# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'
require 'open-uri'
require 'json'

user_id = 3

10.times do

  dog_image_url = JSON.parse(URI.open('https://dog.ceo/api/breeds/image/random').read)["message"]

  owner = Owner.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.full_address
  )
  
  pet = Pet.create!(
    name: Faker::Creature::Dog.name,
    breed: Faker::Creature::Dog.breed,
    age: rand(1..15),
    owner_id: owner.id,
    notes: Faker::Lorem.sentence,
    user_id: user_id,
  )

  file = URI.open(dog_image_url)
  pet.image.attach(io: file, filename: "#{pet.name}.jpg", content_type: "image/jpg")
end