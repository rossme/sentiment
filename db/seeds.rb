
puts "DESTROYING SEEDS..."
Question.destroy_all
puts "SEEDS DESTROYED"
puts "SEEDING QUESTIONS"
Question.create(description: 'How are you today?')
Question.create(description: 'How do you feel?')
Question.create(description: 'Did you sleep well?')
puts "FINISHED SEEDING"