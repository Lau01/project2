User.destroy_all

u1 = User.create name: "Hannah", email: "hannah@pictionary.co", password: "chicken"
u2 = User.create name: "Andy", email: "andy@pictionary.co", password: "chicken"

puts "#{User.all.length} users"

Word.destroy_all

w1 = Word.create word: "dog"
w2 = Word.create word: "cat"
w3 = Word.create word: "apple"
w4 = Word.create word: "bread"
w5 = Word.create word: "star"

puts "#{Word.all.length} words"

Game.destroy_all

g1 = Game.create drawer_id: u1.id, guesser_id: u2.id, word_id: w2.id, status: 'finished', result: 'win'

puts "#{Game.all.length} games"
