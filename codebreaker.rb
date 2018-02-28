
#Note:
#Next step is code for arrays to check against eachother and return match results.
class Codebreaker
	@@turns = 0
	@@games = 0
	def initialize
		@player1 = Player.new
		@computer = Computer.new
		@board = Board.new
		@guesser = Guesser.new
		@coder = Coder.new
		welcome
	end

	#Welcome both players.
	def welcome
		puts "\nWelcome to Codebreaker, #{@player1.name}. In this game,
		you will have 12 guesses to break the computer's
		code, which is comprised of four random numbers
		from 1 to 6.\n"
		sleep(1.5)
		puts "\nFirst, let's see if you or the computer will try code breaking first.\n"
		sleep(1.5)
		puts "Determining order...\n"
		sleep(3)
		order_creator
	end

	#Establish first coder/guesser.
	def order_creator
		num = rand(100)
		if num >= 50
			@guesser = @player1
			@coder = @computer
			puts "\nIt looks like the computer will code first, so you will guess.\n"
			computer_code
		else
			@guesser = @computer
			@coder = @player1
			puts "\n#{@player1.name}, you'll code first, and the computer will guess.\n"
			player_code
		end
	end

	#Randomly generate the computer's color code.
	def computer_code
		4.times do
			@computer.code << rand(6).to_s
		end
		player_guess
	end

	#Player creates code
	def player_code
		puts "\n#{@player1.name}, please enter your four digit code."
		@player1.code = gets.chomp.scan(/\d/).to_a
		#Insert code to ascertain it is only numbers 1-6.
		computer_guess
	end

	#Player guesses code
	def player_guess
		puts "The computer has created its code."
		comparitor
	end

	def comparitor
		total_match = false
		while @guesser.guess_count >= 12 || total_match == false
			puts "Please enter guess number #{@guesser.guess_count}."
			match = false
			matches = 0
			match_loc = []
			@guesser.guesses << gets.chomp.scan(/\d/).to_a
			@guesser.guesses[@guesser.guess_count - 1].each do |guess_num|
				@coder.code.each do |code_num|
					if guess_num == code_num
						match = true
						matches += 1
						if @guesser.guesses.index(guess_num) == @coder.code.index(code_num)
							match_loc << @guesser.guesses.index(guess_num)
						end
					end
				end
			end
			if match == true && match_loc.empty? == true
				puts "You guessed #{matches} numbers correctly! Unfortunately, not at the right location."
				comparitor
				@guesser.guess_count += 1
			elsif match == true && match_loc.empty? == false && match_loc.length < 3
				puts "You guess #{matches} numbers correctly, at spaces #{match_loc}."
				comparitor
				@guesser.guess_count += 1
			elsif match_loc.length == 3
				puts "You broke the code! Great job!"
				total_match = true
				play_again? #Create play again code.
			elsif match == false
				puts "Sorry, none of your numbers are correct."
				@guesser.guess_count += 1
			end
		end		
	end

	def computer_guess
		puts "The computer is creating its guesses."
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
		@guess_count = 1
		@order = 0
	end
end

class Computer
	#Establish computer with secret code, and guesses.
	attr_reader :code
	attr_accessor :guesses, :guess_count, :order
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

class Guesser
	def initialize
	end
end

class Coder
	def initialize
	end
end


#Initalize game: create a new player, and a new board.
#Welcome player to the game.
#Establish coding order; player 1 or computer first.
#Establish code, from computer or player.
#Have break make a guess.
#Compare guess against the code.

