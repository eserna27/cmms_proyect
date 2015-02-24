# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Emmanuel",
			       email: "eserna27@gmail.com",
             password: "eserna27",
             password_confirmation: "eserna27",
             hospital_id: 0,
             user_type: "master")