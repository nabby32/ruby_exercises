

class Codebreaker
	@@turns = 0
	@@games = 0
	#Initialize game based on 1 or 2 players.
	def initialize
		if num_players? == 1
			@player1 = Player.new
			@computer1 = Computer.new
			@opponent = @computer1
			@board = Board.new
			welcome
		else
			@player1 = Player.new
			@player2 = Player.new
			@opponent = @player2
			@board = Board.new
			welcome
		end
	end

	#Get number of players: 1 or 2.
	def num_players?
		puts "Please select one player or two player. (1/2)"
		player_num = gets.chomp
		unless player_num == "one" || player_num == "1" || player_num == "two" || 
		player_num == "2";
			puts "\nDidn't catch that. Please select one or two player."
			num_players?
		end

		if player_num == "1" || player_num == "one"
			player_num = 1
		elsif player_num == "2" || player_num == "two"
			player_num = 2
		end
		player_num
	end

	#Welcome both human players, or computer and player.
	def welcome
		puts "\nWelcome message\n"
		@board.display
		rounds
		if first_up
			puts "\nGreat, #{@rounds_num} round(s). #{@opponent.name}, you will guess #{@player1.name}'s code first."
		else
			puts "\nGreat, #{@rounds_num} round(s). #{@player1.name}, you will guess #{@opponent.name}'s code first."
		end
		puts "\n"
		pick_code
	end

	#Have player select the number of rounds to play.
	def rounds
		puts "\nPlease enter the number of rounds you'd like to play."
		@rounds_num = gets.chomp
		unless @rounds_num.to_i
			puts "Please enter a digit.\n"
			rounds
		end
		@rounds_num = @rounds_num.to_i
	end

	#Randomly select the first person coding and first guessing.
	def first_up
		if rand(2) > 0
			@code_breaker = @opponent
			@coder = @player1
			true
		else
			@code_breaker = @player1
			@coder = @opponent
			false
		end
	end
	#Coder picks code. Need to write for Al to pick code.
	def pick_code
		puts "OK, #{@coder.name}, please enter your code as four letters, with each letter representing the first letter of your chosen color (ex. gyrp)."
		code = gets.chomp.downcase.split("")
		@coder.code << code
		puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nGot it! No peaking, #{@code_breaker.name}!"
		unless checker
			puts "Oops, that's not a valid input. Rembmer to just enter the first letter of four of the available colors: purple, red, green, blue, yellow, and orange."
			pick_code
		end
		puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nGot it! No peaking, #{@code_breaker.name}!"
		code_breaking
	end

	def checker
		#Checks for length; need to check for accuracy of input.
		if @coder.code[0].split(/\s/).length != 4
			false
		else
			true
		end
	end

	def player_switch(current)
		if current == @player1
			@coder = @player2
			@codebreaker = @opponent
		elsif current == @opponent
			@coder = @player1
			@codebreaker = @opponent
		end
		#Return to game 
	end



end

class Player
	attr_reader :name, :code, :guesses
	@@players = 0
	def initialize
		if @@players >= 2
			@@players = 0
			@@players += 1
		elsif @@players < 2
			@@players += 1
		end
		puts "\nPlayer #{@@players}, please enter your name."
		@name = gets.chomp.downcase.capitalize
		@code = []
		@guesses = []
	end
end

class Computer < Player
	attr_reader :name, :code, :guesses
	@@comps = 0
	def initialize
		if @@comps >= 1
			@@comps = 0
			@@comps += 1
		elsif @@comps < 1
			@@comps +=1
		end
		@name = "Al"
	end

end

class Board
	def initialize
		@board = []
		40.times do
			@board << " + "
		end
	end

	def display
		puts "| " + @board[0..3].join(" | ") + " |" + "\n"
		puts "| " + @board[4..7].join(" | ") + " |" + "\n"
		puts "| " + @board[8..11].join(" | ") + " |" + "\n"
		puts "| " + @board[12..15].join(" | ") + " |" + "\n"
		puts "| " + @board[16..19].join(" | ") + " |" + "\n"
		puts "| " + @board[20..23].join(" | ") + " |" + "\n"
		puts "| " + @board[24..27].join(" | ") + " |" + "\n"
		puts "| " + @board[28..31].join(" | ") + " |" + "\n"
		puts "| " + @board[32..35].join(" | ") + " |" + "\n"
		puts "| " + @board[36..39].join(" | ") + " |" + "\n\n"
	end
end


