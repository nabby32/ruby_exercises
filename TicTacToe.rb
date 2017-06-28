class TicTacToe
	def initialize
		@board = Board.new
		@player1 = Player.new
		@player2 = Player.new
	end

	def welcome
		puts "Welcome, #{@player1.name} and #{@player2.name}."
		@board.display
		puts "#{@player1.name}, you go first!"
	end

end

class Board
	attr_reader :board

	def initialize
		@board = (1..9).to_a
	end

	def display
		puts "\n" + @board[0..2].join(" | ") + "\n"
		9.times {print "-"}
		puts "\n" + @board[3..5].join(" | ") + "\n"
		9.times {print "-"}
		puts "\n" + @board[6..8].join(" | ") + "\n\n"
	end

end

class Player
	attr_reader :name, :marker, :marked
	@@player_count = 0

	def initialize
		@@player_count += 1
		puts "Player #{@@player_count}, what is your name?"
		@name = gets.chomp.downcase.capitalize
		(@@player_count % 2) == 1 ? @marker = "X" : @marker = "O"
		@@player_count == 2 ? @@player_count = 0 : @@player_count
		@marked = []
	end


end


