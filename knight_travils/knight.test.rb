require_relative 'knight_moves'
test_moves = [[[3,3],[4,3]],
              [[0,0],[1,2]],
              [[0,0],[3,3]],
              [[3,3],[0,0]],
              [[0,0],[7,7]],
              [[5,5],[5,5]]]

ary_of_paths = [[[3, 3], [1, 4], [3, 5], [4, 3]],
                [[0, 0], [1, 2]],
                [[0, 0], [1, 2], [3, 3]],
                [[3, 3], [2, 1], [0, 0]],
                [[0, 0], [1, 2], [0, 4], [1, 6], [3, 7], [5, 6], [7, 7]],
                [[5, 5]]]

test_moves.each_with_index do |move, i|
  path = knight_moves(move[0], move[1])
  if path != ary_of_paths[i]
    puts "Error occurred.\n\n"
    print "Move "
    p move
    print "Expected path "
    p ary_of_paths[i]
    print "Actual "
    p path
    raise RuntimeError
  end
end

def parse_user_input(str)
  initial = str.split(" ").first.split(',').map { |e| e.to_i }
  target = str.split(" ").last.split(',').map { |e| e.to_i }

  ary = [initial, target]
end

puts "Would you like to try it?(Y/n)"
print "> "
answer = gets.strip.downcase

if answer == 'y'
  puts "Ok, Enter your coordinates in format like '1,2 5,4'"
  puts "Enter 'exit' to exit the program."

  loop do
    puts "Enter your coordinates:"
    print "> "
    answer = gets.strip
    break if answer == 'exit'
    answer = parse_user_input(answer)
    knight_moves(answer[0], answer[1])
  end
end
