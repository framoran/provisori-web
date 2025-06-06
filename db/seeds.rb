# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email: 'admin@extensionschool.ch', password: 'test', name: 'Admin', last_name: 'EPFL', role: 'admin', username: 'admin')
User.create!(email: 'normal@extensionschool.ch', password: 'test', name: 'Normal', last_name: 'EPFL', role: 'registered', username: 'normal')
User.create!(email: 'normal2@extensionschool.ch', password: 'test', name: 'Normal', last_name: 'EPFL', role: 'registered', username: 'normal2')
