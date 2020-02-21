# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all



Comuna.where(name: 'Vitacura').first_or_create
Comuna.where(name: 'Las Condes').first_or_create
Comuna.where(name: 'Lo Barnichea').first_or_create
Comuna.where(name: 'Providencia').first_or_create
Comuna.where(name: 'Nuñoa').first_or_create
Comuna.where(name: 'Santiago').first_or_create
Comuna.where(name: 'San Joaquín').first_or_create
Comuna.where(name: 'San Migel').first_or_create
Comuna.where(name: 'La Reina').first_or_create
Comuna.where(name: 'Macul').first_or_create

User.create(email: 'mail1@com', password: '123456', name: 'user1', description: '1111', native: 'spanish', practico: 'english', photo:'https://interactive-examples.mdn.mozilla.net/media/examples/grapefruit-slice-332-332.jpg', comuna: Comuna.all.sample )
User.create(email: 'mail2@com', password: '123456', name: 'user2', description: '222', native: 'spanish', practico: 'english', photo:'https://www.remove.bg/assets/start_remove-79a4598a05a77ca999df1dcb434160994b6fde2c3e9101984fb1be0f16d0a74e.png', comuna: Comuna.all.sample)
User.create(email: 'mail3@com', password: '123456', name: 'user3', description: '3333', native: 'spanish', practico: 'english', photo:'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRr0DE6w3uIk9_r5rRInCus7r5IoFRKBW_SEG4rZfKlStJvCH7S', comuna: Comuna.all.sample)
User.create(email: 'mail4@com', password: '123456', name: 'user4', description: '4444', native: 'english', practico: 'spanish', photo:'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', comuna: Comuna.all.sample)
User.create(email: 'mail5@com', password: '123456', name: 'user5', description: '5555', native: 'english', practico: 'spanish', photo:'https://secure.gravatar.com/avatar/2ed8aeda33c2d8d526556de14b7027fa?s=400&d=mm&r=g', comuna: Comuna.all.sample)
User.create(email: 'mail6@com', password: '123456', name: 'user6', description: '6666', native: 'spanish', practico: 'english', photo:'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcROPki39aAltbbVRxi4b6OoGd7JAFHYIIaFUvkijatuGoaTCs7S', comuna: Comuna.all.sample)
User.create(email: 'mail7@com', password: '123456', name: 'user7', description: '77777', native: 'spanish', practico: 'english', photo:'https://dyl80ryjxr1ke.cloudfront.net/external_assets/hero_examples/hair_beach_v1785392215/original.jpeg', comuna: Comuna.all.sample)
