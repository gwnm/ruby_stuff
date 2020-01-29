def knight_moves(initial, target)
  require_relative 'lib/knight.rb'
  knight = Knight.new
  path = knight.find_path(initial, target)
  output(initial, target, path)
  path
end

def output(initial, target, path)
  puts "You go from #{initial} to #{target}..."
  puts "You made it in #{path.length - 1} moves. Here's your path:"
  path.each { |move| p move}
  puts ""
end