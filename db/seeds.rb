# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

dinos = [
    {
      name: 'Long Neck',
      age: 69,
      enjoys: 'chowing down.',
      image: 'https://pixabay.com/photos/dinosaur-primeval-times-lizards-4475295/'
    },
    {
      name: 'Tripod',
      age: 33,
      enjoys: 'It is up to you really.',
      image: 'https://pixabay.com/photos/dinosaur-primeval-times-lizards-4475295/'
    },
    {
      name: 'Jersey Mike',
      age: 21,
      enjoys: 'Fist Pumping.',
      image: 'https://image.shutterstock.com/image-photo/crazy-senior-man-dancing-rock-600w-1354969595.jpg'
    }
  ]
  
  dinos.each do |each_dino|
    Dino.create each_dino
    puts "creating dino #{each_dino}"
  end

    p Dino.all
    p "Dino Seeds worked out fine"
