class Codebreaker
	@@turns = 0
	@@games = 0
	def initialize
		if num_players? == 1
			@player1 = Player.new
			@computer1 = Computer.new
			@opponent = @computer1
			@board = Board.new
			welcome(@player1)
		else
			@player1 = Player.new
			@player2 = Player.new
			@opponent = @player2
			@board = Board.new
			welcome(@player1, @player2)
		end
	end

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

	def welcome(p1, p2=nil)
		puts "Thanks for playing, #{@player1.name} and #{@opponent.name}."
		rounds
		if first_up
			puts "Great, #{@rounds_num} rounds. #{@opponent.name}, you will guess #{@player1.name}'s code first."
		else
			puts "Great, #{@rounds_num} rounds. #{@player1.name}, you will guess #{@opponent.name}'s code first."
		end
		gameplay
	end

	def rounds
		puts "\nPlease enter the number of rounds you'd like to play."
		@rounds_num = gets.chomp
		unless @rounds_num.to_i
			puts "Please enter a digit.\n"
			rounds
		end
		@rounds_num = @rounds_num.to_i
	end

	def first_up
		if rand(2) > 0
			true
		else
			false
		end
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
		@board = (0..40).to_a
	end
end


