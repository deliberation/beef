# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(
  first_name: 'Klaus',
  last_name: 'Meier',
  email: 'klaus@foo.org',
  password: '123456'
)

3.times do |i|
  Proposition.create(
    user: user,
    title: "Proposition #{i}",
    text: "I want to #{i}#{i}#{i}"
  )
end
