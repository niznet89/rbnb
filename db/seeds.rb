require "open-uri"
require 'json'
require 'faker'


buffer = Cloudinary::Api.resources.to_a[0][1]

Commission.destroy_all
User.destroy_all
Artwork.destroy_all
Service.delete_all


user_one = User.create(first_name: 'Pablo', last_name: 'Picasso', email: 'pablo@gmail.com', phone_number: '123-456-7890', password: 'abc12345', role: 'artist')
user_two = User.create(first_name: 'Leo', last_name: 'Da Vinchi', email: 'leo@gmail.com', phone_number: '123-456-7890', password: 'abc12345', role: 'artist')
user_three = User.create(first_name: 'Frida', last_name: 'Cannelle', email: 'frida@gmail.com', phone_number: '123-456-7890', password: 'abc12345', role: 'artist')
user_four = User.create(first_name: 'Aphonso', last_name: 'Dali', email: 'aphonso@gmail.com', phone_number: '123-456-7890', password: 'abc12345', role: 'artist')


category_one = 'painting'
category_two = 'digital art'
category_three = 'sculpture'

puts "Generating Artworks..."
buffer.each do |object|
  file = URI.open(object["url"])
  article = Artwork.new(title: Faker::Kpop.boy_bands, category: [category_one, category_two, category_three].sample, user: [user_one, user_two].sample)
  article.photo.attach(io: file, filename: object["public_id"] + '.jpg', content_type: 'image/jpg')
  article.save!
end

# file_1 = URI.open("https://res.cloudinary.com/dmty5wfjh/image/upload/v1645792818/assets/ping_pong.jpg")
# article_1 = Artwork.new(title: "My one true love", category: category_one, user: user_four)
# article_1.photo.attach(io: file_1, filename: 'ping_pong.jpg', content_type: 'image/jpg')
# article_1.save!
# file_2 = URI.open("https://res.cloudinary.com/dmty5wfjh/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1645792819/smiley_face.jpg")
# article_2 = Artwork.new(title: "Hehe 😉", category: category_one, user: user_three)
# article_2.photo.attach(io: file_2, filename: 'smiley_face.jpg', content_type: 'image/jpg')
# article_2.save!
# file_3 = URI.open("https://res.cloudinary.com/dmty5wfjh/image/upload/v1645792818/assets/aphonso_art.jpg")
# article_3 = Artwork.new(title: "It's me!", category: category_one, user: user_four)
# article_3.photo.attach(io: file_3, filename: 'aphonso_art.jpg', content_type: 'image/jpg')
# article_3.save!
# file_4 = URI.open("https://res.cloudinary.com/dmty5wfjh/image/upload/v1645792818/assets/shrooms.jpg")
# article_4 = Artwork.new(title: "My babies", category: category_one, user: user_three)
# article_4.photo.attach(io: file_4, filename: 'shrooms.jpg', content_type: 'image/jpg')
# article_4.save!

service_one = Service.create(name: 'Large painting', category: 'painting', price: 100, user: user_one)
service_two = Service.create(name: 'Medium painting', category: 'painting', price: 50, user: user_one)
service_three = Service.create(name: 'Small painting', category: 'painting', price: 25, user: user_one)
service_four = Service.create(name: 'Large painting', category: 'painting', price: 100, user: user_two)
service_five = Service.create(name: 'Medium painting', category: 'painting', price: 50, user: user_two)
service_six = Service.create(name: 'Small painting', category: 'painting', price: 25, user: user_two)
Commission.create(user_id: 1, art_description: "its cool", art_price: service_one.price, service_id: service_one.id)
puts "Generated #{Artwork.count} artworks"
