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

Drawing.destroy_all

d1 = Drawing.create image: "https://placebear.com/400/400", user_id: u1, word_id: w1

d1 = Drawing.create image: "https://placebear.com/400/400", user_id: u2, word_id: w2

d1 = Drawing.create image: "https://placebear.com/400/400", user_id: u2, word_id: w3

d1 = Drawing.create image: "https://placebear.com/400/400", user_id: u1, word_id: w4

d1 = Drawing.create image: "https://placebear.com/400/400", user_id: u2, word_id: w5

puts "#{Drawing.all.length} drawings"


Game.destroy_all

g1 = Game.create drawer_id: u1, guesser_id: u2, word_id: w2, status: 'waiting', result: 'win', image: 'https://placekitten.com/200/300'
