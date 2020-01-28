class Player

	def initialize()

		set_name

	end



	def set_name

		puts "Please input Player's name"

		@name = (gets.chomp.to_s.capitalize)

	end



	def name

		@name

	end

end