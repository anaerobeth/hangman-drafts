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

  times_to_loop = target.count guess_letter
  puts times_to_loop

  (1..times_to_loop).each do |times|
    puts "Loop number #{times}"
  end
  break

  if target.include?(guess_letter)
    ind = target.index(guess_letter)
    puts "Found index of #{guess_letter}: #{ind}"
    occurence = occurence + 1
    new_starting_index = ind + 1
    if target.index(guess_letter, new_starting_index)
      occurence = occurence + 1
      puts "Found index of #{guess_letter}: #{ind}"
    end
    puts "Found #{occurence} occurence(s) of the #{guess_letter} character."
  else
    puts "Sorry, no #{guess_letter}'s found."
  end

  if chances == 1
    puts "You're out of chances, better luck next time..."
  end
  chances -= 1

end