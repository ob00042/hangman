puts "Hangman Initialized!"



def find_word
alphabet = File.readlines "5desk.txt"
alphabet.each do |entry|
  entry.delete!("\n")
end
word = ""
loop do
  word = alphabet.sample
  break if (word.length > 4) && (word.length < 13)
end
word
end

# word = find_word(alphabet)
# puts word

def display_array(word)
  display_array = Array.new(word.length, "_")

end

# disp_array = display_array(word)
# print disp_array

def guess_letter

  puts "Give me a letter for your guess!"
  guess = gets.chomp

end

def check(guess, word, display_array, trials_array)
  
  i = 0
  match = false
  while i < word.length 
  	if word[i] == guess
  		display_array[i] = guess
  		match = true
  	end
  	i += 1
  end
  if match == false
  	trials_array << guess
  end

end

def game_over(display_array)

  unless display_array.any?{  |letter| letter = "_" }
  	puts "You won!"
  	return
  end

end

def game
  
  puts "Let's play Hangman!"
  puts "You have 10 rounds to find the word"
  word = find_word
  display_array = display_array(word)
  trials_array = []
  count = 1
  10.times do 
  	print display_array
  	puts ""
  	puts "This is round #{count}"
  	puts "Failed letters: #{trials_array}"
  	count += 1
  	guess = guess_letter
  	check(guess, word, display_array, trials_array)
  	game_over(display_array)
  end
  puts "You lost!"

end

game