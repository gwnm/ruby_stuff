class GameBoard 

	@win = false

	@draw = false

	@@playerturn = 0

	@@rows = [@@row1 = {:a1 => ' ', :b1 => ' ', :c1 => ' '},

		  @@row2 = {:a2 => ' ', :b2 => ' ', :c2 => ' '},

		  @@row3 = {:a3 => ' ', :b3 => ' ', :c3 => ' '}]

	def initialize

		draw_board

	end



	def win

		@win

	end



	def draw

		@draw

	end



	def draw_board

		puts "    A   B   C  "

		puts "   --- --- --- "

		puts "1 | #{@@row1[:a1]} | #{@@row1[:b1]} | #{@@row1[:c1]} |"

		puts "   --- --- --- "

		puts "2 | #{@@row2[:a2]} | #{@@row2[:b2]} | #{@@row2[:c2]} |"

		puts "   --- --- --- "

		puts "3 | #{@@row3[:a3]} | #{@@row3[:b3]} | #{@@row3[:c3]} |"

		puts "   --- --- --- "

	end



	def list_available_moves

		available=[]		

		 @@rows.each do |row| 

		 	row.each do |key, value|

		 		if value == ' '

		 			available << key

		 		end

		 end

		end

		 available

	end



	def chose(location)

		 @@rows.each do |rows| 

		 	rows.each do|key, value| 

		 		if key == location && value == ' '

		 			@@playerturn.even? ? rows[key] = "X" : rows[key] = "O"

		 			@@playerturn += 1

		 		end

		 	end

		 end

	end



	def check_win

		win_x = ["X","X","X"]

		win_o = ["O","O","O"]



		winning_combos = [			

			[@@row1[:a1],@@row2[:a2],@@row3[:a3]],

			[@@row1[:b1],@@row2[:b2],@@row3[:b3]],

			[@@row1[:c1],@@row2[:c2],@@row3[:c3]],

			[@@row1[:a1],@@row1[:b1],@@row1[:c1]],

			[@@row2[:a2],@@row2[:b2],@@row2[:c2]],

			[@@row3[:a3],@@row3[:b3],@@row3[:c3]],

			[@@row1[:a1],@@row2[:b2],@@row3[:c3]],

			[@@row3[:a3],@@row2[:b2],@@row1[:c1]]]



		winning_combos.each do |row| 

			if row == win_x 

				@win = true

			elsif row == win_o

				@win = true

			end

		end

	end



	def check_draw

		if @@playerturn >= 9 

			@draw = true

		end

	end

end