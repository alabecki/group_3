# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(username: 'Tim', email: 't@example.org', street_address: '1234 hasting st', password: '123456', city: 'burnaby', country: 'canada')
User.create!(username: 'Jen', email: 'jen@example.org', street_address: '8888 university dr', password: '123456', city: 'burnaby', country: 'canada')
User.create!(username: 'Alex', email: 'a@example.org', street_address: '200 6th ave', password: '123456', city: 'new westminster', country: 'canada')
User.create!(username:  'Admin',
             email: 'admin@gmail.com',
             street_address: '555 Top ave.',
             city: 'halifax',
             country: 'canada',
             password:              'foobar',
             password_confirmation: 'foobar',
             admin: true)


