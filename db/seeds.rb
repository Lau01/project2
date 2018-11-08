User.destroy_all

u1 = User.create name: "Hannah", email: "hannah@test.co", password: "chicken"

u2 = User.create name: "Andy",
email: "andy@test.co", password: "chicken"

puts "#{User.all.length} users"

Word.destroy_all

w1 = Word.create word: "dog"
w2 = Word.create word: "cat"
w3 = Word.create word: "apple"
w4 = Word.create word: "bread"
w5 = Word.create word: "star"
w6 = Word.create word: "chair"
w7 = Word.create word: "cup"
w8 = Word.create word: "face"
w9 = Word.create word: "shirt"
w10 = Word.create word: "pants"

puts "#{Word.all.length} words"

Game.destroy_all

g1 = Game.create drawer_id: u1, guesser_id: u2, word_id: w2, status: 'finished', result: 'win'

puts "#{Game.all.length} games"
