puts "Hangman Initialized!"

alphabet = File.readlines "5desk.txt"
alphabet.each do |entry|
  entry.delete!("\n")
end

def find_word(array)
word = ""
loop do
  word = array.sample
  break if (word.length > 4) && (word.length < 13)
end
word
end

word = find_word(alphabet)
puts word



