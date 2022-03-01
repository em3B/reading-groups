puts "Resetting database..."

Answer.destroy_all
Question.destroy_all
DailyReading.destroy_all
Text.destroy_all
Member.destroy_all
ReadingGroup.destroy_all
User.destroy_all

puts "Done!"

puts "Creating teacher..."

User.create!(
  email: "emily@hogwarts.ac.uk",
  password: '123456',
  name: "Emily",
  teacher: true,
  school_name: "Hogwarts",
  teacher_id: 1
)

puts "Done!"

puts "Creating students..."

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: '123456',
    name: Faker::Name.first_name,
    teacher: false,
    school_name: "Hogwarts"
  )
end

puts "Done!"

puts "Creating reading group..."

ReadingGroup.create!(
  user_id: User.find_by(teacher_id: 1).id
)

puts "Done!"

puts "Creating members..."

User.all.each do |user|
  Member.create!(
    user: user,
    reading_group: ReadingGroup.first
  )
end

puts "Done!"

puts "Creating text..."

Text.create!(
  title: "Harry Potter and the Philosopher's Stone",
  author: 'J. K. Rowling',
  cover_image: "https://res.cloudinary.com/dm37aktki/image/upload/v1645566231/development/65w3tdfn58fv1yc7piadykpykx21.jpg",
  content: "
    — CHAPTER ONE —
    The Boy Who Lived
    Mr and Mrs Dursley, of number four, Privet Drive, were proud to
    say that they were perfectly normal, thank you very much. They
    were the last people you’d expect to be involved in anything
    strange or mysterious, because they just didn’t hold with such
    nonsense.
    Mr Dursley was the director of a firm called Grunnings, which
    made drills. He was a big, beefy man with hardly any neck,
    although he did have a very large moustache. Mrs Dursley was
    thin and blonde and had nearly twice the usual amount of neck,
    which came in very useful as she spent so much of her time craning
    over garden fences, spying on the neighbours. The Dursleys had a
    small son called Dudley and in their opinion there was no finer
    boy anywhere.
    The Dursleys had everything they wanted, but they also had a
    secret, and their greatest fear was that somebody would discover
    it. They didn’t think they could bear it if anyone found out about
    the Potters. Mrs Potter was Mrs Dursley’s sister, but they hadn’t
    met for several years; in fact, Mrs Dursley pretended she didn’t
    have a sister, because her sister and her good-for-nothing husband
    were as unDursleyish as it was possible to be. The Dursleys
    shuddered to think what the neighbours would say if the Potters
    arrived in the street. The Dursleys knew that the Potters had a
    small son, too, but they had never even seen him. This boy was
    another good reason for keeping the Potters away; they didn’t
    want Dudley mixing with a child like that.
    When Mr and Mrs Dursley woke up on the dull, grey Tuesday
    our story starts, there was nothing about the cloudy sky outside to
    suggest that strange and mysterious things would soon be happening all over the country. Mr Dursley hummed as he picked out
    his most boring tie for work and Mrs Dursley gossiped away
    happily as she wrestled a screaming Dudley into his high chair.
    None of them noticed a large tawny owl flutter past the window.
    At half past eight, Mr Dursley picked up his briefcase, pecked
    Mrs Dursley on the cheek and tried to kiss Dudley goodbye but
    missed, because Dudley was now having a tantrum and throwing
    his cereal at the walls. ‘Little tyke,’ chortled Mr Dursley as he left
    the house. He got into his car and backed out of number four’s
    drive.
    It was on the corner of the street that he noticed the first sign
    of something peculiar – a cat reading a map. For a second, Mr
    Dursley didn’t realise what he had seen – then he jerked his head
    around to look again. There was a tabby cat standing on the corner
    of Privet Drive, but there wasn’t a map in sight. What could
    he have been thinking of? It must have been a trick of the light.
    Mr Dursley blinked and stared at the cat. It stared back. As Mr
    Dursley drove around the corner and up the road, he watched the
    cat in his mirror. It was now reading the sign that said Privet Drive
    – no, looking at the sign; cats couldn’t read maps or signs. Mr
    Dursley gave himself a little shake and put the cat out of his
    mind. As he drove towards town he thought of nothing except a
    large order of drills he was hoping to get that day.
    But on the edge of town, drills were driven out of his mind by
    something else. As he sat in the usual morning traffic jam, he
    couldn’t help noticing that there seemed to be a lot of strangely
    dressed people about. People in cloaks. Mr Dursley couldn’t bear
    people who dressed in funny clothes – the get-ups you saw on
    young people! He supposed this was some stupid new fashion. He
    drummed his fingers on the steering wheel and his eyes fell on a
    huddle of these weirdos standing quite close by. They were whispering excitedly together. Mr Dursley was enraged to see that a
    couple of them weren’t young at all; why, that man had to be older
    than he was, and wearing an emerald-green cloak! The nerve of
    him! But then it struck Mr Dursley that this was probably some
    silly stunt – these people were obviously collecting for something
    ... yes, that would be it. The traffic moved on, and a few minutes
    later, Mr Dursley arrived in the Grunnings car park, his mind
    back on drills.
    Mr Dursley always sat with his back to the window in his office
    on the ninth floor. If he hadn’t, he might have found it harder to
    concentrate on drills that morning. He didn’t see the owls
    swooping past in broad daylight, though people down in the
    street did; they pointed and gazed open-mouthed as owl after owl
    sped overhead. Most of them had never seen an owl even at nighttime. Mr Dursley, however, had a perfectly normal, owl-free morning. He yelled at five different people. He made several important
    telephone calls and shouted a bit more. He was in a very good
    mood until lunch-time, when he thought he’d stretch his legs
    and walk across the road to buy himself a bun from the baker’s
    opposite.
    He’d forgotten all about the people in cloaks until he passed a
    group of them next to the baker’s. He eyed them angrily as he
    passed. He didn’t know why, but they made him uneasy. This lot
    were whispering excitedly, too, and he couldn’t see a single
    collecting tin. It was on his way back past them, clutching a large
    doughnut in a bag, that he caught a few words of what they were
    saying.
    ‘The Potters, that’s right, that’s what I heard –’
    ‘– yes, their son, Harry –’
    Mr Dursley stopped dead. Fear flooded him. He looked back at
    the whisperers as if he wanted to say something to them, but
    thought better of it.
    He dashed back across the road, hurried up to his office,
    snapped at his secretary not to disturb him, seized his telephone
    and had almost finished dialling his home number when he
    changed his mind. He put the receiver back down and stroked his
    moustache, thinking ... no, he was being stupid. Potter wasn’t
    such an unusual name. He was sure there were lots of people
    called Potter who had a son called Harry. Come to think of it, he
    wasn’t even sure his nephew was called Harry. He’d never even
    seen the boy. It might have been Harvey. Or Harold. There was no
    point in worrying Mrs Dursley, she always got so upset at any
    mention of her sister. He didn’t blame her – if he’d had a sister like
    that ... but all the same, those people in cloaks ...
    He found it a lot harder to concentrate on drills that afternoon,
    and when he left the building at five o’clock, he was still so
    worried that he walked straight into someone just outside the door.
    ‘Sorry,’ he grunted, as the tiny old man stumbled and almost
    fell. It was a few seconds before Mr Dursley realised that the man
    was wearing a violet cloak. He didn’t seem at all upset at being
    almost knocked to the ground. On the contrary, his face split into
    a wide smile and he said in a squeaky voice that made passers-by
    stare: ‘Don’t be sorry, my dear sir, for nothing could upset me
    today! Rejoice, for You-Know-Who has gone at last! Even
    Muggles like yourself should be celebrating, this happy happy
    day!’
    And the old man hugged Mr Dursley around the middle and
    walked off."
)

puts "Done!"

puts "Creating daily reading..."

DailyReading.create!(
  text: Text.first,
  reading_group: ReadingGroup.first,
  excerpt: Text.first.content
)

puts "Done!"

puts "Creating questions..."

QUESTION_CONTENTS = [
  "What do you think of the main character's behaviour in this scene?",
  "What did you enjoy about this chapter?",
  "Were there any words you didn't understand?"
]

counter = 0
3.times do
  Question.create!(
    daily_reading: DailyReading.first,
    content: QUESTION_CONTENTS[counter],
    active: true,
    extension: false
  )
  counter += 1
end

Question.create!(
  daily_reading: DailyReading.first,
  content: "Rewrite the chapter from the perspective of Mr. Dursley.",
  active: true,
  extension: true
)

puts "Done!"

# puts "Creating users..."

# 10.times do
#   User.create!(
#     email: Faker::Internet.email,
#     password: '123456'
#   )
# end

# # TODO Need to nest readinggroups creation inside user creation

# puts "Done!"

# puts "Creating reading groups..."

# 10.times do
#   ReadingGroup.create!(
#     user_id: User.all.sample.id
#   )
# end

# puts "Done!"

# puts "Creating members..."

# counter = 0
# 10.times do
#   Member.create!(
#     user: User.all[counter],
#     reading_group: ReadingGroup.all[counter]
#   )
#   counter += 1
# end

# puts "Done!"

# puts "Creating texts..."

# 10.times do
#   Text.create!(
#     title: Faker::Book.title,
#     author: Faker::Book.author,
#     content: Faker::Lorem.words(number: 500)
#   )
# end

# puts "Done!"

# puts "Creating daily readings..."

# counter = 0
# 10.times do
#   daily_reading = DailyReading.create!(
#     text: Text.all.sample,
#     reading_group: ReadingGroup.all.sample,
#     excerpt: Faker::Lorem.words(number: 100)
#   )
#   ReadingGroup.all[counter].daily_readings << daily_reading
#   counter += 1
# end

# puts "Done!"

# puts "Creating questions..."

# QUESTION_CONTENTS = [
#   "What do you think of the main character's behaviour in this scene?",
#   "What did you enjoy about this chapter?",
#   "Were there any words you didn't understand?"
# ]

# counter = 0
# 3.times do
#   question = Question.create!(
#     # daily_reading: DailyReading.all.sample,
#     content: QUESTION_CONTENTS[counter],
#     active: true
#   )
#   counter += 1
#   DailyReading.all.each do |daily_reading|
#     daily_reading.questions << question
#   end
# end

# # DailyReading.all.each do |daily_reading| #loop through all DRs
# #   Question.all.each do |question| #loop through all Qs
# #     daily_reading.questions << question # assign all Qs to each DR
# #   end
# # end

# puts "Done!"

# puts "Creating answers..."

# 10.times do
#   Answer.create!(
#     user: User.all.sample,
#     question: Question.all.sample
#   )
# end

# puts "Done!"
