# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PROJECT_TITLES = 10.times.map { Faker::Internet.domain_word }

PROJECT_USERS = {
  "taman@gmail.com" => PROJECT_TITLES[0, 4],
  "mekky@gmail.com" => PROJECT_TITLES[4..-1]
}

PROJECT_USERS.each do |email, projects|
  user = User.new(email: email, password:"secret")
  projects.each{|project| user.projects.build(title: project)}
  user.save
end
