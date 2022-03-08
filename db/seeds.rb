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
    Chapter Eight
The Deathday Party

October arrived, spreading a damp chill over the grounds and into the castle. Madam Pomfrey, the nurse, was kept busy by a sudden spate of colds among the staff and students. Her Pepperup potion worked instantly, though it left the drinker smoking at the ears for several hours afterward. Ginny Weasley, who had been looking pale, was bullied into taking some by Percy. The steam pouring from under her vivid hair gave the impression that her whole head was on fire.

Raindrops the size of bullets thundered on the castle windows for days on end; the lake rose, the flower beds turned into muddy streams, and Hagrid's pumpkins swelled to the size of garden sheds. Oliver Wood's enthusiasm for regular training sessions, however, was not dampened, which was why Harry was to be found, late one stormy Saturday afternoon a few days before Halloween, returning to Gryffindor Tower, drenched to the skin and splattered with mud.

Even aside from the rain and wind it hadn't been a happy practice session. Fred and George, who had been spying on the Slytherin team, had seen for themselves the speed of those new Nimbus Two Thousand and Ones. They reported that the Slytherin team was no more than seven greenish blurs, shooting through the air like missiles.

As Harry squelched along the deserted corridor he came across somebody who looked just as preoccupied as he was. Nearly Headless Nick, the ghost of Gryffindor Tower, was staring morosely out of a window, muttering under his breath, \". . . don't fulfill their requirements . . . half an inch, if that . . .\"

\"Hello, Nick,\" said Harry.

\"Hello, hello,\" said Nearly Headless Nick, starting and looking round. He wore a dashing, plumed hat on his long curly hair, and a tunic with a ruff, which concealed the fact that his neck was almost completely severed. He was pale as smoke, and Harry could see right through him to the dark sky and torrential rain outside.

\"You look troubled, young Potter,\" said Nick, folding a transparent letter as he spoke and tucking it inside his doublet.

\"So do you,\" said Harry.

\"Ah,\" Nearly Headless Nick waved an elegant hand, \"a matter of no importance. . . . It\'s not as though I really wanted to join. . . . Thought I\'d apply, but apparently I \'don\'t fulfill requirements' -\"

In spite of his airy tone, there was a look of great bitterness on his face.

\"But you would think, wouldn't you,\" he erupted suddenly, pulling the letter back out of his pocket, \"that getting hit forty-five times in the neck with a blunt axe would qualify you to join the Headless Hunt?\"

\"Oh - yes,\" said Harry, who was obviously supposed to agree.

\"I mean, nobody wishes more than I do that it had all been quick and clean, and my head had come off properly, I mean, it would have saved me a great deal of pain and ridicule. However -\" Nearly Headless Nick shook his letter open and read furiously: "'We can only accept huntsmen whose heads have parted company with their bodies. You will appreciate that it would be impossible otherwise for members to participate in hunt activities such as Horseback Head-Juggling and Head Polo. It is with the greatest regret, therefore, that I must inform you that you do not fulfill our requirements. With very best wishes, Sir Patrick Delaney-Podmore.'"

Fuming, Nearly Headless Nick stuffed the letter away.

\"Half an inch of skin and sinew holding my neck on, Harry! Most people would think that's good and beheaded, but oh, no, it's not enough for Sir Properly Decapitated-Podmore.\"

Nearly Headless Nick took several deep breaths and then said, in a far calmer tone, \"So - what's bothering you? Anything I can do?\"

\"No,\" said Harry. \"Not unless you know where we can get seven free Nimbus Two Thousand and Ones for our match against Sly -\"
  "
)

puts "Done!"

puts "Creating daily reading..."

DailyReading.create!(
  text: Text.first,
  reading_group: ReadingGroup.first,
  session_date: Date.today,
  excerpt: "
    — CHAPTER ONE —

    The Boy Who Lived

    Mr and Mrs Dursley, of number four, Privet Drive, were proud to say that they were perfectly normal, thank you very much. They were the last people you’d expect to be involved in anything strange or mysterious, because they just didn’t hold with such nonsense.
Mr Dursley was the director of a firm called Grunnings, which made drills. He was a big, beefy man with hardly any neck, although he did have a very large moustache. Mrs Dursley was thin and blonde and had nearly twice the usual amount of neck, which came in very useful as she spent so much of her time craning over garden fences, spying on the neighbours. The Dursleys had a small son called Dudley and in their opinion there was no finer boy anywhere.
The Dursleys had everything they wanted, but they also had a secret, and their greatest fear was that somebody would discover it. They didn’t think they could bear it if anyone found out about the Potters. Mrs Potter was Mrs Dursley’s sister, but they hadn’t met for several years; in fact, Mrs Dursley pretended she didn’t have a sister, because her sister and her good-for-nothing husband were as unDursleyish as it was possible to be. The Dursleys shuddered to think what the neighbours would say if the Potters arrived in the street. The Dursleys knew that the Potters had a small son, too, but they had never even seen him. This boy was another good reason for keeping the Potters away; they didn’t want Dudley mixing with a child like that.
When Mr and Mrs Dursley woke up on the dull, grey Tuesday our story starts, there was nothing about the cloudy sky outside to suggest that strange and mysterious things would soon be happening all over the country. Mr Dursley hummed as he picked out his most boring tie for work and Mrs Dursley gossiped away happily as she wrestled a screaming Dudley into his high chair.
None of them noticed a large tawny owl flutter past the window.
At half past eight, Mr Dursley picked up his briefcase, pecked Mrs Dursley on the cheek and tried to kiss Dudley goodbye but missed, because Dudley was now having a tantrum and throwing his cereal at the walls. ‘Little tyke,’ chortled Mr Dursley as he left the house. He got into his car and backed out of number four’s drive.
It was on the corner of the street that he noticed the first sign of something peculiar – a cat reading a map. For a second, Mr Dursley didn’t realise what he had seen – then he jerked his head around to look again. There was a tabby cat standing on the corner of Privet Drive, but there wasn’t a map in sight. What could he have been thinking of? It must have been a trick of the light. Mr Dursley blinked and stared at the cat. It stared back. As Mr Dursley drove around the corner and up the road, he watched the cat in his mirror. It was now reading the sign that said Privet Drive – no, looking at the sign; cats couldn’t read maps or signs. Mr Dursley gave himself a little shake and put the cat out of his mind. As he drove towards town he thought of nothing except a large order of drills he was hoping to get that day.
  "
)

DailyReading.create!(
  text: Text.first,
  reading_group: ReadingGroup.first,
  session_date: "2022-03-03",
  excerpt: "
    He’d forgotten all about the people in cloaks until he passed a group of them next to the baker’s. He eyed them angrily as he passed. He didn’t know why, but they made him uneasy. This lot were whispering excitedly, too, and he couldn’t see a single collecting tin. It was on his way back past them, clutching a large doughnut in a bag, that he caught a few words of what they were saying.
The Potters, that’s right, that’s what I heard –’
‘– yes, their son, Harry –’
Mr Dursley stopped dead. Fear flooded him. He looked back at the whisperers as if he wanted to say something to them, but thought better of it.
He dashed back across the road, hurried up to his office, snapped at his secretary not to disturb him, seized his telephone and had almost finished dialling his home number when he changed his mind. He put the receiver back down and stroked his moustache, thinking ... no, he was being stupid. Potter wasn’t such an unusual name. He was sure there were lots of people called Potter who had a son called Harry. Come to think of it, he wasn’t even sure his nephew was called Harry. He’d never even seen the boy. It might have been Harvey. Or Harold. There was no point in worrying Mrs Dursley, she always got so upset at any mention of her sister. He didn’t blame her – if he’d had a sister like that ... but all the same, those people in cloaks ...
He found it a lot harder to concentrate on drills that afternoon, and when he left the building at five o’clock, he was still so worried that he walked straight into someone just outside the door.
‘Sorry,’ he grunted, as the tiny old man stumbled and almost fell. It was a few seconds before Mr Dursley realised that the man was wearing a violet cloak. He didn’t seem at all upset at being almost knocked to the ground. On the contrary, his face split into a wide smile and he said in a squeaky voice that made passers-by stare: ‘Don’t be sorry, my dear sir, for nothing could upset me today! Rejoice, for You-Know-Who has gone at last! Even Muggles like yourself should be celebrating, this happy happy day!’
And the old man hugged Mr Dursley around the middle and walked off.
Mr Dursley stood rooted to the spot. He had been hugged by a complete stranger. He also thought he had been called a Muggle, whatever that was. He was rattled. He hurried to his car and set off home, hoping he was imagining things, which he had never hoped before, because he didn’t approve of imagination.
As he pulled into the driveway of number four, the first thing he saw – and it didn’t improve his mood – was the tabby cat he’d spotted that morning. It was now sitting on his garden wall. He was sure it was the same one; it had the same markings around its eyes.
‘Shoo!’ said Mr Dursley loudly.
The cat didn’t move. It just gave him a stern look. Was this normal cat behaviour, Mr Dursley wondered. Trying to pull himself together, he let himself into the house. He was still determined not to mention anything to his wife.
Mrs Dursley had had a nice, normal day. She told him over dinner all about Mrs Next Door’s problems with her daughter and how Dudley had learnt a new word (‘Shan’t!’). Mr Dursley tried to act normally. When Dudley had been put to bed, he went into the living-room in time to catch the last report on the evening news:
And finally, bird-watchers everywhere have reported that the nation’s owls have been behaving very unusually today. Although owls normally hunt at night and are hardly ever seen in daylight, there have been hundreds of sightings of these birds flying in every direction since sunrise. Experts are unable to explain why the owls have suddenly changed their sleeping pattern.’ The news reader allowed himself a grin. ‘Most mysterious. And now, over to Jim McGuffin with the weather. Going to be any more showers of owls tonight, Jim?’
‘Well, Ted,’ said the weatherman, ‘I don’t know about that, but it’s not only the owls that have been acting oddly today. Viewers as far apart as Kent, Yorkshire and Dundee have been phoning in to tell me that instead of the rain I promised yesterday, they’ve had a downpour of shooting stars! Perhaps people have been celebrating Bonfire Night early – it’s not until next week, folks! But I can promise a wet night tonight.’
Mr Dursley sat frozen in his armchair. Shooting stars all over Britain? Owls flying by daylight? Mysterious people in cloaks all over the place? And a whisper, a whisper about the Potters ...
  "
)

DailyReading.create!(
  text: Text.first,
  reading_group: ReadingGroup.first,
  session_date: "2022-03-04",
  excerpt: "
   Mrs Dursley came into the living-room carrying two cups of tea. It was no good. He’d have to say something to her. He cleared his throat nervously. ‘Er – Petunia, dear – you haven’t heard from your sister lately, have you?’
As he had expected, Mrs Dursley looked shocked and angry. After all, they normally pretended she didn’t have a sister.
‘No,’ she said sharply. ‘Why?’
‘Funny stuff on the news,’ Mr Dursley mumbled. ‘Owls ... shooting stars ... and there were a lot of funny-looking people in town today …’
‘So?’ snapped Mrs Dursley.
‘Well, I just thought ... maybe ... it was something to do with ... you know ... her lot.’
Mrs Dursley sipped her tea through pursed lips. Mr Dursley wondered whether he dared tell her he’d heard the name ‘Potter’. He decided he didn’t dare. Instead he said, as casually as he could, ‘Their son – he’d be about Dudley’s age now, wouldn’t he?’
‘I suppose so,’ said Mrs Dursley stiffly.
‘What’s his name again? Howard, isn’t it?’
‘Harry. Nasty, common name, if you ask me.’
‘Oh, yes,’ said Mr Dursley, his heart sinking horribly. ‘Yes, I quite agree.’
He didn’t say another word on the subject as they went upstairs to bed. While Mrs Dursley was in the bathroom, Mr Dursley crept to the bedroom window and peered down into the front garden. The cat was still there. It was staring down Privet Drive as though it was waiting for something.
Was he imagining things? Could all this have anything to do with the Potters? If it did ... if it got out that they were related to a pair of – well, he didn’t think he could bear it.
The Dursleys got into bed. Mrs Dursley fell asleep quickly but Mr Dursley lay awake, turning it all over in his mind. His last, comforting thought before he fell asleep was that even if the Potters were involved, there was no reason for them to come near him and Mrs Dursley. The Potters knew very well what he and Petunia thought about them and their kind ... He couldn’t see how he and Petunia could get mixed up in anything that might be going on. He yawned and turned over. It couldn’t affect them ...
How very wrong he was.
Mr Dursley might have been drifting into an uneasy sleep, but the cat on the wall outside was showing no sign of sleepiness. It was sitting as still as a statue, its eyes fixed unblinkingly on the far corner of Privet Drive. It didn’t so much as quiver when a car door slammed in the next street, nor when two owls swooped overhead. In fact, it was nearly midnight before the cat moved at all.
A man appeared on the corner the cat had been watching, appeared so suddenly and silently you’d have thought he’d just popped out of the ground. The cat’s tail twitched and its eyes narrowed.
Nothing like this man had ever been seen in Privet Drive. He was tall, thin and very old, judging by the silver of his hair and beard, which were both long enough to tuck into his belt. He was wearing long robes, a purple cloak which swept the ground and high-heeled, buckled boots. His blue eyes were light, bright and sparkling behind half-moon spectacles and his nose was very long and crooked, as though it had been broken at least twice. This man’s name was Albus Dumbledore.
Albus Dumbledore didn’t seem to realise that he had just arrived in a street where everything from his name to his boots was unwelcome. He was busy rummaging in his cloak, looking for something. But he did seem to realise he was being watched, because he looked up suddenly at the cat, which was still staring at him from the other end of the street. For some reason, the sight of the cat seemed to amuse him. He chuckled and muttered, ‘I should have known.’
He had found what he was looking for in his inside pocket. It seemed to be a silver cigarette lighter. He flicked it open, held it up in the air and clicked it. The nearest street lamp went out with a little pop. He clicked it again – the next lamp flickered into darkness. Twelve times he clicked the Put-Outer, until the only lights left in the whole street were two tiny pinpricks in the distance, which were the eyes of the cat watching him. If anyone looked out of their window now, even beady-eyed Mrs Dursley, they wouldn’t be able to see anything that was happening down on the pavement. Dumbledore slipped the Put-Outer back inside his cloak and set off down the street towards number four, where he sat down on the wall next to the cat. He didn’t look at it, but after a moment he spoke to it.
‘Fancy seeing you here, Professor McGonagall.’
He turned to smile at the tabby, but it had gone. Instead he was smiling at a rather severe-looking woman who was wearing square glasses exactly the shape of the markings the cat had had around its eyes. She, too, was wearing a cloak, an emerald one. Her black hair was drawn into a tight bun. She looked distinctly ruffled.
How did you know it was me?’ she asked.
‘My dear Professor, I’ve never seen a cat sit so stiffly.’
‘You’d be stiff if you’d been sitting on a brick wall all day,’ said Professor McGonagall.
‘All day? When you could have been celebrating? I must have passed a dozen feasts and parties on my way here.’
Professor McGonagall sniffed angrily.
‘Oh yes, everyone’s celebrating, all right,’ she said impatiently. ‘You’d think they’d be a bit more careful, but no – even the Muggles have noticed something’s going on. It was on their news.’ She jerked her head back at the Dursleys’ dark living-room window. ‘I heard it. Flocks of owls ... shooting stars ... Well, they’re not completely stupid. They were bound to notice something. Shooting stars down in Kent – I’ll bet that was Dedalus Diggle. He never had much sense.’
‘You can’t blame them,’ said Dumbledore gently. ‘We’ve had precious little to celebrate for eleven years.’
‘I know that,’ said Professor McGonagall irritably. ‘But that’s no reason to lose our heads. People are being downright careless, out on the streets in broad daylight, not even dressed in Muggle clothes, swapping rumours.’
She threw a sharp, sideways glance at Dumbledore here, as though hoping he was going to tell her something, but he didn’t, so she went on: ‘A fine thing it would be if, on the very day YouKnow-Who seems to have disappeared at last, the Muggles found out about us all. I suppose he really has gone, Dumbledore?’

  "
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
