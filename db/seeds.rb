require "open-uri"
require 'json'
require 'faker'
require 'byebug'

buffer = Cloudinary::Api.resources.to_a[0][1]

Commission.destroy_all
User.destroy_all
Artwork.destroy_all
Service.delete_all


user_one = User.create(first_name: 'Pablo', last_name: 'Picasso', email: 'pablo@gmail.com', phone_number: '123-456-7890', password: 'abc12345', role: 'artist')
user_two = User.create(first_name: 'Leo', last_name: 'Da Vinchi', email: 'leo@gmail.com', phone_number: '123-456-7890', password: 'abc12345', role: 'artist')


puts "Generating Artworks..."
buffer.each do |object|
  file = URI.open(object["url"])
  article = Artwork.new(title: Faker::Kpop.boy_bands, category: 'painting', user: [user_one, user_two].sample)
  article.photo.attach(io: file, filename: object["public_id"] + '.jpg', content_type: 'image/jpg')
  article.save!
end
service_one = Service.create(name: 'Large painting', category: 'painting', price: 100, user: user_one)
service_two = Service.create(name: 'Medium painting', category: 'painting', price: 50, user: user_one)
service_three = Service.create(name: 'Small painting', category: 'painting', price: 25, user: user_one)
service_four = Service.create(name: 'Large painting', category: 'painting', price: 100, user: user_two)
service_five = Service.create(name: 'Medium painting', category: 'painting', price: 50, user: user_two)
service_six = Service.create(name: 'Small painting', category: 'painting', price: 25, user: user_two)
Commission.create(user_id: 1, art_description: "its cool", art_price: service_one.price, service_id: service_one.id)
puts "Generated #{Artwork.count} artworks"
