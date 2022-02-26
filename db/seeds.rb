puts "Resetting database..."

Answer.destroy_all
Question.destroy_all
DailyReading.destroy_all
Text.destroy_all
Member.destroy_all
ReadingGroup.destroy_all
User.destroy_all

puts "Done!"

puts "Creating users..."

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: '123456'
  )
end

puts "Done!"

puts "Creating reading groups..."

10.times do
  ReadingGroup.create!(
    user_id: User.all.sample.id
  )
end

puts "Done!"

puts "Creating members..."

10.times do
  Member.create!(
    user: User.all.sample,
    reading_group: ReadingGroup.all.sample
  )
end

puts "Done!"

puts "Creating texts..."

10.times do
  Text.create!(
    title: Faker::Book.title,
    author: Faker::Book.author,
    content: Faker::Lorem.words(number: 500)
  )
end

puts "Done!"

puts "Creating daily readings..."

10.times do
  DailyReading.create!(
    text: Text.all.sample,
    reading_group: ReadingGroup.all.sample,
    excerpt: Faker::Lorem.words(number: 100)
  )
end

puts "Done!"

puts "Creating questions..."

10.times do
  Question.create!(
    daily_reading: DailyReading.all.sample,
    content: Faker::Lorem.words(number: 50)
  )
end

puts "Done!"

puts "Creating answers..."

10.times do
  Answer.create!(
    user: User.all.sample,
    question: Question.all.sample
  )
end

puts "Done!"
