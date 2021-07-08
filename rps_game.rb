class Game
  attr_accessor :person_1, :person_2
      def initialize(x, y) # x and y are placeholders for 2 arguments that are now given player_1 and player_2 respectively
      @person_1 = x #player_1 is assigned to instance variable person_1
      @person_2 = y #player_2 is assigned to instance variable person_1
      end
  
      def play()
        puts "You played #{person_1.choice} and Computer played #{person_2.choice}." # everywhere in this method person_1 is player_1 and person_2 is player_2 
          if person_1.choice == "paper" && person_2.choice == "rock" # I can call the variable person_1.choice, because it is in effect player_1.choice
              puts "#{person_1.name} Wins!" # I can call the variable person_1.name, because it is in effect player_1.name. Same for person_2
            elsif  person_1.choice == "paper" && person_2.choice == "scissors"
              puts "#{person_2.name} wins!"
            elsif  person_1.choice == "rock" && person_2.choice == "paper"
              puts "#{person_2.name} wins!"
            elsif  person_1.choice == "rock" && person_2.choice == "scissors"
              puts "#{person_1.name} Wins!"
            elsif  person_1.choice == "scissors" && person_2.choice == "paper"
              puts "#{person_1.name} Wins!"
            elsif  person_1.choice == "scissors" && person_2.choice == "rock"
              puts "#{person_2.name} wins!"
            else puts "It's a draw!"
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
  puts "You played #{player_1.choice} and Computer played #{player_2.choice}."
  game.play()
