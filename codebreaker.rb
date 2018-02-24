
#Note:
#Next step is code for arrays to check against eachother and return match results.
class Codebreaker
	@@turns = 0
	@@games = 0
	def initialize
		@player1 = Player.new
		@computer = Computer.new
		@board = Board.new
		welcome
	end

	#Welcome both players.
	def welcome
		puts "\nWelcome to Codebreaker, #{@player1.name}. In this game,
		you will have 12 guesses to break the computer's
		code, which is comprised of four random numbers
		from 1 to 6.\n"
		@board.display
		puts "\nFirst, let's see if you or the computer will try code breaking first.\n
		Determining order...\n"
		order_creator
	end

	#Establish first coder/guesser.
	def order_creator
		num = (rand(100)/100).to_f
		if num >= 0.5
			@player1.order = 2
			@computer.order = 1
			puts "\nIt looks like the computer will code first, so you will guess.\n"
			computer_code
		else
			@player1.order = 1
			@computer.order = 2
			puts "\n#{@player1.name}, you'll code first, and the computer will guess.\n"
			player_code
		end
	end

	#Randomly generate the computer's color code.
	def computer_code
		4.times do
			@computer.code << rand(6)
		end
	end

	#Player creates code
	def player_code
		puts "\n#{@player1.name}, please enter your four digit code."
		@player1.code = gets.chomp.scan(/\d/).to_a
		computer_guess
	end

	#Player guesses code
	def player_guess
		puts "The computer has created its code. Please enter guess number #{@player1.guess_count}."
		@player1.guesses << gets.chomp.scan(/\d/).to_a
		@player1.guess_count += 1
		#Code to compare guesses against computer code.

	end

end

class Player
	#Establish player with name, their secret code, and their guesses.
	attr_reader :name
	attr_accessor :code, :guesses, :guess_count, :order
	@@players = 1
	def initialize
		puts "\nPlayer #{@@players}, please enter your name."
		@name = gets.chomp.downcase.capitalize
		@code = []
		@guesses = []
		@guess_count = 0
		@order = 0
	end
end

class Computer
	#Establish computer with secret code, and guesses.
	attr_accessor :code, :guesses, :guess_count, :order
	def initialize
		@code = []
		@guesses = []
		@guess_count = 0
		@order = 0
	end
end

class Board
	#Establish a blank board showing layout only.
	def initialize
		@board = []
		48.times do
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
		puts "| " + @board[36..39].join(" | ") + " |" + "\n"
		puts "| " + @board[40..43].join(" | ") + " |" + "\n"
		puts "| " + @board[44..47].join(" | ") + " |" + "\n\n"
	end
end


#Initalize game: create a new player, and a new board.
#Welcome player to the game.
#Establish coding order; player 1 or computer first.
#Establish code, from computer or player.

