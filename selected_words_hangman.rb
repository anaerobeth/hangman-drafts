#!/usr/bin/env ruby
word_bank = ["sesame", "closed", "swoons", "wheeze", "pepper"]
word = ['_', '_', '_', '_', '_', '_' ]
chances = 8

puts "Welcome to Hangman!"
target = word_bank.sample
puts target

while chances >= 1
  print "Word: "
  print word.to_s
  puts
  print "Chances remaining: "
  puts chances
  print "Guess a single letter (a-z) or the entire word:"
  guess_letter = gets.chomp

  if guess_letter.length > 1
    word = guess_letter
  end

  if word == target
    puts "Congratulations, you've guessed the word!"
    break
  end

  occurence = 0

  occurence = target.count guess_letter
  puts "Number of occurences is: #{occurence}"


  starting_index = 0
  (1..occurence).each do |times|
    puts "Loop number #{times}"
    puts "At the start of the loop, starting index is: #{starting_index}"
    if target.index(guess_letter, starting_index)
      ind = target.index(guess_letter, starting_index)
      puts "Found index of #{guess_letter}: #{ind}"
      starting_index = ind + 1
      puts "At the end of the loop, starting index is: #{starting_index}"
      puts
    end
  end


  if occurence == 0
    puts "Sorry, no #{guess_letter}'s found."
  else
    puts "Found #{occurence} occurence(s) of the #{guess_letter} character."
  end

  if chances == 1
    puts "You're out of chances, better luck next time..."
  end
  chances -= 1

end