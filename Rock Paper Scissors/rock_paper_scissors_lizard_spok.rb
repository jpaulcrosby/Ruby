############################################################
#
#  Name:            Paul Crosby
#  Assignment:      Rock, Paper, Scissors, Lizard, Spock
#  Date:            2/1/19
#  Class:           CIS 282
#  Description:     A game of Rock, Paper, Scissors, Lizard, Spock
#
############################################################

# User consent to play game + Instructions
puts
puts "Would you like to play Rock, Paper, Scissors, Lizard, Spock?"
puts
puts "Y = Yes"
puts "N = No"
puts
puts "INSTRUCTIONS"
puts
puts "The game is played by entering a 1, 2, 3, 4, or 5: \n\n\t- 1 for rock \n\t- 2 for paper \n\t- 3 for scissors \n\t- 4 for Lizard \n\t- 5 for Spock"
puts
puts "The computer will randomly do the same."
puts
puts "Scissors cuts Paper"
puts "Paper covers Rock"
puts "Rock crushes Lizard"
puts "Lizard poisons Spock"
puts "Spock smashes Scissors"
puts "Scissors decapitates Lizard"
puts "Lizard eats Paper"
puts "Paper disproves Spock"
puts "Spock vaporizes Rock"
puts "Rock crushes Scissors"
puts
print "Y or N: "

user_consent = gets.chomp.upcase

# Validate User Input to ensure they entered a Y or N
while user_consent != "Y" && user_consent != "N"
  print "You didn't answer with a \"Y\" or \"N.\" Try again: "
  user_consent = gets.chomp.upcase
end

# Initialize Scores at 0
wins = 0
losses = 0
ties = 0

# While the user wants to play, loop through the game
while user_consent == "Y"
  puts

  # Get user input (Rock, Paper or Scissors) and store in a variable
  puts "1. Rock"
  puts "2. Paper"
  puts "3. Scissors"
  puts "4. Lizard"
  puts "5. Spock"
  user_input = gets.to_i

  # Validate User Input
  while user_input < 1 || user_input > 5
    puts "You didnt enter a 1, 2, 3, 4 or 5. Please try again."
    user_input = gets.to_i
  end

  # Computer chooses number
  computer_number = rand(0..4)

  # Game Logic
  options = [
      ["Rock", "Crushes", "Lizard", "Scissors"],  # Rock
      ["Paper", "Covers", "Rock", "Spock"],        # Paper
      ["Scissors", "Cuts", "Paper", "Lizard"],        # Scissors
      ["Lizard", "Poisons", "Spock", "Paper"],      # Lizard
      ["Spock", "Vaporizes", "Scissors", "Rock"]   # Spock
  ]

  # store user and computer selection in variables so I can write fewer lines of code each time i refer to them.
  my_hand = options[user_input-1]
  computer_hand = options[computer_number]

  # display my choice and the computer's choice. I make the choices upcase just to improve readability
  puts "My hand is #{my_hand[0].upcase}"
  puts "The computer's hand is #{computer_hand[0].upcase}."

  # tie block
  if my_hand[0] == computer_hand[0]
    puts "It's a Draw!"
    ties+=1
  # Win block
  elsif my_hand.index(computer_hand[0]) == 2 || my_hand.index(computer_hand[0]) == 3
    # This is where things start to go kind of off the rails.
    # I wanted to make sure that the verb for each pair was correct.
    # So I had a default and some exceptions when verbiage didnt follow my default
    # Same problem for losses block
    if my_hand[0] == "Lizard" && computer_hand[0] == "Paper"
      puts "#{my_hand[0]} eats #{computer_hand[0]}. You win!"
      wins+=1
    elsif my_hand[0] == "Paper" && computer_hand[0] == "Spock"
      puts "#{my_hand[0]} disproves #{computer_hand[0]}. You win!"
      wins+=1
    elsif my_hand[0] == "Spock" && computer_hand[0] == "Scissors"
      puts "#{my_hand[0]} smashes #{computer_hand[0]}. You win!"
      wins+=1
    elsif my_hand[0] == "Scissors" && computer_hand[0] == "Lizard"
      puts "#{my_hand[0]} decapitates #{computer_hand[0]}. You win!"
      wins+=1
    else
      puts "#{my_hand[0]} #{my_hand[1]} #{computer_hand[0]}. You win!"
      wins+=1
    end
  #lose block
  else
    if my_hand[0] == "Spock" && computer_hand[0] == "Paper"
      puts "#{computer_hand[0]} disproves #{my_hand[0]}. You lose!"
      losses+=1
    elsif my_hand[0] == "Paper" && computer_hand[0] == "Lizard"
      puts "#{computer_hand[0]} eats #{my_hand[0]}. You lose!"
      losses+=1
    elsif my_hand[0] == "Scissors" && computer_hand[0] == "Spock"
      puts "#{computer_hand[0]} smashes #{my_hand[0]}. You lose!"
      losses+=1
    elsif my_hand[0] == "Lizard" && computer_hand[0] == "Scissors"
      puts "#{computer_hand[0]} decapitates #{my_hand[0]}. You lose!"
      losses+=1
    else
      puts "#{computer_hand[0]} #{computer_hand[1]} #{my_hand[0]}. You lose!"
      losses+=1
    end
  end
  puts
  puts
  puts "wins: #{wins}"
  puts "losses: #{losses}"
  puts "ties: #{ties}"
  puts
  puts
  puts "Go again? (Y or N)"
  user_consent = gets.chomp.upcase
  # Validate User Input
  while user_consent != "Y" && user_consent != "N"
    print "You didn't answer with a \"Y\" or \"N.\" Try again: "
    user_consent = gets.chomp.upcase
  end
end
# User selects N at onset without playing at all
if wins + losses + ties == 0
  puts "OK, the program will end now. Goodbye!"
  puts "wins: #{wins}"
  puts "losses: #{losses}"
  puts "ties: #{ties}"
# User Plays 1 or more games and ends.
else
  puts "Game over. Thanks for playing!"
  puts "wins: #{wins}"
  puts "losses: #{losses}"
  puts "ties: #{ties}"
end