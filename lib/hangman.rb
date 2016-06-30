require "yaml"

class Hangman

puts "Hangman Initialized!"

attr_accessor :word, :display_array, :trials_array, :count

def initialize

  

end

def self.find_word
alphabet = File.readlines "5desk.txt"
alphabet.each do |entry|
  entry.delete!("\n")
end
word = ""
loop do
  word = alphabet.sample
  break if (word.length > 4) && (word.length < 13)
end
word.downcase!
word
end

# word = find_word(alphabet)
# puts word

def self.display_array(word)
  display_array = Array.new(word.length, "_")

end

# disp_array = display_array(word)
# print disp_array

def self.guess_letter

  puts "Give me a letter for your guess!"
  guess = gets.chomp
  guess.downcase!
  guess

end

def self.check(guess, word, display_array, trials_array)
  
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

def self.game_over(display_array)

  unless display_array.any?{  |letter| letter = "_" }
  	puts "You won!"
  	return
  end

end


def self.game
  
  puts "Let's play Hangman!"
  puts "You have 10 rounds to find the word"
  puts "Do you want to load a game? (y/n)"
  load = gets.chomp
  if load == "y"
  	file = load_game
  	word = file[0]
  	count = file[1]
  	display_array = file[2]
  	trials_array = file[3]
  else
    word = find_word
    display_array = display_array(word)
    trials_array = []
    count = 1
  end
  play(word, count, display_array, trials_array)

end

def self.play(word, count, display_array, trials_array)
  10.times do 
  	save_game(word, count, display_array, trials_array)
  	print display_array
  	puts ""
  	puts "This is round #{count} of 10"
  	puts "Failed letters: #{trials_array}"
  	count += 1
  	guess = guess_letter
  	check(guess, word, display_array, trials_array)
  	game_over(display_array)
  end
  puts "You lost!"
  puts "The secret work was: #{word}"
end


end

def save_game(word, count, display_array, trials_array)
  
  puts "Do you want to save the game? (y/n)"
  answer = gets.chomp
  if answer == "y"
      File.open("saved_game/saved.yml", "w")do |file| 
        file.write(YAML.dump([word, count, display_array, trials_array]))
	  end
  end

end

def load_game

    file = YAML::load(File.read("saved_game/saved.yml"))

end


Hangman.game