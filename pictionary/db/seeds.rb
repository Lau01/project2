User.destroy_all

u1 = User.create name: "Hannah", email: "hannah@pictionary.co", password: "chicken"

u2 = User.create name: "Andy",
email: "andy@pictionary.co", password: "chicken"

puts "#{User.all.length} users"

Word.destroy_all

w1 = Word.create word: "Dog"
w2 = Word.create word: "Cat"
w3 = Word.create word: "Apple"
w4 = Word.create word: "Bread"
w5 = Word.create word: "Star"

puts "#{Word.all.length} words"

# Drawing.destroy_all
#
# d1 = Drawing.create image: "https://placebear.com/400/400", user_id: u1, word_id: w1
#
# d1 = Drawing.create image: "https://placebear.com/400/400", user_id: u2, word_id: w2
#
# d1 = Drawing.create image: "https://placebear.com/400/400", user_id: u2, word_id: w3
#
# d1 = Drawing.create image: "https://placebear.com/400/400", user_id: u1, word_id: w4
#
# d1 = Drawing.create image: "https://placebear.com/400/400", user_id: u2, word_id: w5
#
# puts "#{Drawing.all.length} drawings"


Game.destroy_all

g1 = Game.create drawer: u1, guesser: u2, word: w2, status: 'finished', result: 'win', image: 'https://placebear.com/200/200'

g2 = Game.create drawer: u1, guesser: u2, word: w3, status: 'finished', result: 'win', image: 'https://placekitten.com/200/200'

g3 = Game.create drawer: u2, guesser: u1, word: w4, status: 'finished', result: 'win', image: 'https://fillmurray.com/200/200'

g4 = Game.create drawer: u2, guesser: u1, word: w1, status: 'finished', result: 'win', image: 'https://placebear.com/200/200'

g5 = Game.create drawer: u2, guesser: u1, word: w1, status: 'finished', result: 'win', image: 'https://placekitten.com/200/200'

g6 = Game.create drawer: u2, guesser: u1, word: w1, status: 'finished', result: 'win', image: 'https://fillmurray.com/200/200'
