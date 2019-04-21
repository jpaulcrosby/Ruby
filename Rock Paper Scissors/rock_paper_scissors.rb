############################################################
#
#  Name:            Paul Crosby
#  Assignment:      Rock, Paper, Scissors
#  Date:            1/30/19
#  Class:           CIS 282
#  Description:     A game of Rock, Paper, Scissors
#
############################################################

# User consent to play game + Instructions
puts
puts "Would you like to play Rock, Paper, Scissors?"
puts
puts "Y = Yes"
puts "N = No"
puts
puts "INSTRUCTIONS"
puts
puts "The game is played by entering a 1, 2, or 3: \n\n\t- 1 for rock \n\t- 2 for paper \n\t- 3 for scissors"
puts
puts "The computer will randomly do the same."
puts
puts "Rock beats scissors but loses to paper."
puts "Paper beats rock but loses to scissors."
puts "Scissors beats paper but loses to rock."
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
  user_input = gets.to_i

  # Validate User Input
  while user_input < 1 || user_input > 3
    puts "You didnt enter a 1, 2, or 3. Please try again."
    user_input = gets.to_i
  end

  # Computer chooses number
  computer_number = rand(1..3)

  # Initialize variable storing choices. (Array structure logic explained below.)
  options = [
    ["Paper", "Rock", "Scissors"],
    ["Scissors", "Paper", "Rock"],
    ["Rock", "Scissors", "Paper"]
  ]

  # store user and computer selection in variables so I can write fewer lines of code each time i refer to them.
  my_hand = options[user_input - 1]
  computer_hand = options[computer_number - 1]

  # display my choice and the computer's choice. I make the choices upcase just to improve readability
  puts "My choice: #{my_hand[1].upcase}."
  puts "Computer choice: #{computer_hand[1].upcase}."

  # This code till the end of the while loop is the game logic.
  # If the computer selects a value to the right of my selection (in position 2) I win.
  # That is how the array above is structured. The user selection is always in the middle.
  # The number to the left (position 0) beats the middle selection.
  # For each win, loss, and tie increment that score
  if my_hand.index(computer_hand[1]) > 1
    puts "YOU WIN! :D"
    wins +=1
  elsif my_hand.index(computer_hand[1]) < 1
    puts "YOU LOSE! :("
    losses +=1
  else
    puts "IT'S A DRAW. :|"
    ties +=1
  end
  # This will loop them back to the beginning if they want to continue playing. Extra puts just for spacing
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