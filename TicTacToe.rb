class TicTacToe

@@plays = 0

	def initialize
		@board = Board.new
		@player1 = Player.new
		@player2 = Player.new
		@player_up = @player1
		welcome
	end

	def welcome
		puts "Hi #{@player1.name} and #{@player2.name}! Let's play Tic-Tac-Toe! \n\n"
		@board.display
		puts "#{@player_up.name}, you go first this time."
		choose(@player_up)
	end

	def choose(player)
		if @@plays >= 9
			puts "It's a DRAW!! Good game!"
			replay
		end
		puts "\n#{@player_up.name}, please choose the square you'd like to mark."
		print ">"
		place = gets.chomp.to_i - 1

		unless (place.is_a? Integer) && (place >= 0) && (place <= 8)
			puts "\nThat's not a valid selection. Please choose again.\n"
			choose(@player_up)
		end

		if (@board.check(@player_up, place)) == true
			@player_up.picks << place
			@@plays += 1
			puts "\n"
			@board.display
			player_switch(@player_up)
			if @@plays >= 5 
				winner?
			end
		else
			puts "\nThat spot is marked already; please choose another.\n"
			choose(@player_up)
		end
	end

	def player_switch(current)
		if current == @player1
			@player_up = @player2
		elsif current == @player2
			@player_up = @player1
		end
		choose(@player_up) 
	end

	def replay
		print "Play again? (Y/N)"
		reply = gets.chomp.downcase
		random = (rand(2) + 1)
		if reply == "y" || reply == "yes"
			random == 1 ? @player_up = @player1 : @player_up = @player2
			@@plays = 0
			@board = Board.new
			@board.display
			puts "#{@player_up.name}, you go first this time."
			choose(@player_up)
		elsif reply == "n" || reply == "no"
			puts "OK, thanks for playing!"
			puts "Exiting..."
			exit
		else
			puts "Sorry, didn't catch that."
			replay
		end
	end


end

class Player
	attr_reader :name, :picks, :marker
	@@players = 0

	def initialize
		if @@players < 2
			@@players += 1
		else	
			@@players = 0
			@@players += 1
		end
		puts "Player #{@@players}, please put your name."
		@name = gets.chomp.downcase.capitalize
		@@players % 2 == 0 ? @marker = "O" : @marker = "X"
		puts "Thank you #{@name}, you are #{@marker}'s.\n\n"
		@picks = []
	end
end

class Board
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

	def check(player, place)
		if @board[place] == place + 1
			@board[place] = player.marker
			true
		else
			false
		end
	end
end





