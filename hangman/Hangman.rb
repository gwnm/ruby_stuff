require './color.rb'





puts "Hello and Welcome To ..."

print "



  /\\  /\\__ _ _ __ ___   __ _ _ __ ___   __ _ _ __  

 / /_/ / _` | '_ ` _ \\ / _` | '_ ` _ \\ / _` | '_ \\ 

/ __  / (_| | | | | | | (_| | | | | | | (_| | | | |

\\/ /_/ \\__,_|_| |_| |_|\\__, |_| |_| |_|\\__,_|_| |_|

                      |___/                       

".red

sleep(0.4)

puts " ** HOW TO PLAY **".magenta

sleep(0.4)

puts ""

puts "1-The Computer will chose a word randomly".blue

sleep(0.4)

puts ""

puts "2-and you keep guessing each letter until the whole word is revealed".blue

sleep(0.4)

puts ""

puts "3-or your man will be hanged !".blue

sleep(1.4)

puts ""



(1..3).each do |c|

    print "\r △".magenta

    sleep(0.2)

    print "\r ▷".magenta

    sleep(0.2)

    print "\r ▽".magenta

    sleep(0.2)

    print "\r ◁".magenta

    sleep(0.2)

  end

  puts ""





puts "The Game Will start right now :) Good luck".yellow

puts ""



# words_file = File.open("5desk.txt",w)

# puts words_file



def word_generator

total_words = []

File.open("5desk.txt", "r") do |f|

    f.each_line do |line|

        total_words << line 

    end

  end

words_count = 61407

random_number = rand(0...words_count)

random_word = total_words[random_number]

# random_word if random_word.length >= 5

end



chosen_word = word_generator

last_two = chosen_word.length - 2

word_array = chosen_word[0...last_two].split("")

user_guess = []

letters_used = []

counter = 0

won = false

#puts chosen_word

word_array = word_array.map(&:downcase)

puts ""

word_array.each{|i| user_guess << " - "}

puts "the word contains #{word_array.length} letters".green 

puts ""

print " #{user_guess.join}"

puts ""

loop {

puts ""  

puts "What is your guess for now ? (single letter)".cyan

    print "you have used: #{letters_used}".green if letters_used.length > 0

    puts ""

guess = gets.chomp.downcase

if word_array.include?(guess)

    index_counter = 0     

    word_array.each {|i|

    if i == guess

    user_guess[index_counter] = guess

    end

    index_counter +=1

    }

    puts ""

    print " #{user_guess.join} "

    puts ""

    print "you have used: #{letters_used}".green if letters_used.length > 0

    puts ""



    if user_guess.all? {|i| i != " - "}

        won = true

    end

else

    #DRAW HANGMAN

    letters_used << guess

    hangman_arr = ["

    +---+

    |   |

        |

        |

        |

        |

  =========

  ", "

    +---+

    |   |

    O   |

        |

        |

        |

  =========", "

    +---+

    |   |

    O   |

    |   |

        |

        |

  =========", "

    +---+

    |   |

    O   |

   /|   |

        |

        |

  =========", "

    +---+

    |   |

    O   |

   /|\\  |

        |

        |

  =========", "

    +---+

    |   |

    O   |

   /|\\  |

   /    |

        |

  =========", "

    +---+

    |   |

    O   |

   /|\\  |

   / \\  |

        |

  ========="]

    puts ""

    puts "#{hangman_arr[counter]}".yellow

    puts ""

        counter+=1            

    

end



    if won 

        puts "Hurray You are a Winner".magenta

        break

    end



    if counter == 7

        puts "You lost :(".red

        sleep 0.5

        puts "By the Way the word was '#{chosen_word}'".cyan

        sleep 0.5

        puts "Good luck next time".green

        break

    end

}