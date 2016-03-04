# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(username: 'Pam', email: 'p@example.org', street_address: '234 hasting st', password: '123456', city: 'burnaby', country: 'canada', lol: true)
User.create!(username: 'Jen', email: 'jen@example.org', street_address: '8888 university dr', password: '123456', city: 'burnaby', country: 'canada')
User.create!(username: 'Alex', email: 'a@example.org', street_address: '200 6th ave', password: '123456', city: 'new westminster', country: 'canada')

