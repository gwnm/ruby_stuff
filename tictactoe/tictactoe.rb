require_relative "GameBoard.rb"
require_relative "Player.rb"

def switch_player

	@current_player == @player_1.name ? @current_player = @player_2.name : @current_player = @player_1.name

end

@player_1 = Player.new

@player_2 = Player.new

@current_player = @player_1.name

puts

puts "#{@player_1.name} and #{@player_2.name} are ready to play Tic-Tac-Toe!"

puts

gameboard = GameBoard.new

until gameboard.win || gameboard.draw do 

	puts "These are the available moves" 

	puts gameboard.list_available_moves

	puts "#{@current_player}, where would you like to move?"

	position = gets.chomp.to_sym

	gameboard.chose(position)

	gameboard.draw_board

	gameboard.check_win

	gameboard.check_draw

	if gameboard.win

		puts "#{@current_player} wins!"

	elsif gameboard.draw

		puts "It's a draw! Try again."

	end

	switch_player

end