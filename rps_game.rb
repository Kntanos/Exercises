class Game
  attr_accessor :person_1, :person_2
      def initialize(x, y) # x and y are placeholders for 2 arguments that are now given player_1 and player_2 respectively
      @person_1 = x #player_1 is assigned to instance variable person_1
      @person_2 = y #player_2 is assigned to instance variable person_1
      end
  
      def play()
        puts "You played #{person_1.choice} and Computer played #{person_2.choice}."
        combo = { "scissors" => "paper", "paper" => "rock", "rock" => "scissors" }
        if person_1.choice == person_2.choice
          puts "It's a draw!"
        elsif combo[person_1.choice] == person_2.choice
          puts "Kostas won!"
        else
          puts "Computer won!"
        end
      end
  end
  
  class Player
      attr_accessor :name, :choice #notice that :choice is not an argument, but it is an instance variable
      def initialize(name)
          @name = name
          @choice = make_choice # this instance variable equals the return of the method make_choice
      end
  
      def make_choice
          ["rock", "paper", "scissors"].sample
      end
  end
  
  player_1 = Player.new("Kostas")
      
  player_2 = Player.new("Computer")
  
  game = Game.new(player_1, player_2)  # gives objects player_1 and player_2 of class Player as arguments to a new instance object of class Game
  game.play()
