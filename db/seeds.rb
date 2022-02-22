user_one = User.create(first_name: 'John', last_name: 'Doe', email: 'john@gmail.com', phone_number: '123-456-7890', password: 'abc12345', role: 'artist')
Artwork.destroy_all
Service.destroy_all
Commission.destroy_all

puts "Generating Artworks..."
Artwork.create!(title: 'Paint me like one of those french ladies', category: 'painting', user_id: 1)
Artwork.create(title: 'Ping-pong: A portrait of love ', category: 'painting', user_id: 1)
Artwork.create(title: 'Dog: My best friend', category: 'sculpture', user_id: 1)
Artwork.create(title: 'Ecstasy of coding', category: 'painting', user_id: 1)
service_one = Service.create(name: 'Large painting', category: 'painting', price: 100, user_id: 1)
Commission.create(user_id: 1, art_description: "its cool", art_price: service_one.price, service_id: service_one.id)
puts "Generated #{Artwork.count} artworks"
