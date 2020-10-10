
puts "DESTROYING SEEDS..."
Question.destroy_all
puts "SEEDS DESTROYED"
puts "SEEDING QUESTIONS"

data = [
    { description: "How are you today?" },
    { description: "How do you feel?" },
    { description: "Did you sleep well?" },
]

data.each do | props |
    question = Question.create!({
        description: props[:description]
    })
end

puts "FINISHED SEEDING"

