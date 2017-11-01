require 'faker'

puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating 5 fake restaurants...'
5.times do
  restaurant = Restaurant.new(
    name: Faker::Book.title,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: (["chinese", "italian", "japanese", "french", "belgian"]).to_a.sample
  )
  restaurant.save!
end
puts 'Finished!'

