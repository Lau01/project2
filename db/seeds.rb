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

g1 = Game.create drawer_id: u1.id, guesser_id: u2.id, word_id: w7.id, status: 'finished', result: 'win', image: "xpccnyzjh1zgbn4lkams"

g2 = Game.create drawer_id: u1.id, guesser_id: u2.id, word_id: w1.id, status: 'finished', result: 'win', image: "dyhzxnpqwm1aqo7dpk1r"

g3 = Game.create drawer_id: u1.id, guesser_id: u2.id, word_id: w5.id, status: 'finished', result: 'win', image: "mgvxzpo9kjrwp0tfnfui"

g4 = Game.create drawer_id: u1.id, guesser_id: u2.id, word_id: w5.id, status: 'finished', result: 'win', image: "m5d5mf5sumyl0klan2lq"

g5 = Game.create drawer_id: u1.id, guesser_id: u2.id, word_id: w6.id, status: 'finished', result: 'win', image: "nhgfxm1tc59v4rxncoff"

g6 = Game.create drawer_id: u1.id, guesser_id: u2.id, word_id: w9.id, status: 'finished', result: 'win', image: "gzamqn1auhdt5yzutxvx"

g7 = Game.create drawer_id: u1.id, guesser_id: u2.id, word_id: w4.id, status: 'finished', result: 'win', image: "flvukovtqftbvv2vwuki"



puts "#{Game.all.length} games"
