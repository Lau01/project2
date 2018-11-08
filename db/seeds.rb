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

g1 = Game.create drawer_id: u1.id, guesser_id: u2.id, word_id: w10.id, status: 'finished', result: 'win', image: "ixottwadygs9g6qhzf4c"

g2 = Game.create drawer_id: u1.id, guesser_id: u2.id, word_id: w9.id, status: 'finished', result: 'win', image: "bht92lvazx5tual88quf"

g3 = Game.create drawer_id: u1.id, guesser_id: u2.id, word_id: w6.id, status: 'finished', result: 'win', image: "hbr1fmgotm51ggzdvn4q"

g4 = Game.create drawer_id: u1.id, guesser_id: u2.id, word_id: w5.id, status: 'finished', result: 'win', image: "opaf5jfscwuaezbyn9j4"

g5 = Game.create drawer_id: u1.id, guesser_id: u2.id, word_id: w3.id, status: 'finished', result: 'win', image: "bztamftpdinwyveapsxe"

g6 = Game.create drawer_id: u1.id, guesser_id: u2.id, word_id: w2.id, status: 'finished', result: 'win', image: "hvuv1l3lxfkpwy7e3fgr"



puts "#{Game.all.length} games"
