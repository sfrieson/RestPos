# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: "Gadoe", position: "Manager", password:"admin1") unless User.find_by_username("Gadoe")
30.times {Tabletop.create} unless Tabletop.all.length > 1
