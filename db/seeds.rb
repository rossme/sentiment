

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "DESTROYING SEEDS..."
Question.destroy_all
puts "SEEDS DESTROYED"
puts "SEEDING QUESTIONS"
Question.create(description: 'How are you today?')
Question.create(description: 'How do you feel?')
Question.create(description: 'Did you sleep well?')
puts "FINISHED SEEDING"