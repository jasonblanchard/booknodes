# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.new(:email => 'jason@example.com', :password => 'testpass').upsert
user = User.where(:email => 'jason@example.com').first

user.book_events.new(:title => "Hitchhiker's Guide to the Galaxy").upsert
event = user.book_events.where(:title => "Hitchhiker's Guide to the Galaxy").first
