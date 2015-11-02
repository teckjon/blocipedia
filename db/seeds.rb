# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 require 'faker'
 
  5.times do
   User.create!(
     email:   Faker::Internet.email,
     password: Faker::Internet.password
   )
 end
 
 users = User.all
 
  25.times do
  Wiki.create!(
     title: Faker::Lorem.words, 
     body: Faker::Lorem.sentence
     )
 end
 Wiki = Wiki.all

 puts "#{User.count} users created"
 puts "#{Wiki.count} users created"