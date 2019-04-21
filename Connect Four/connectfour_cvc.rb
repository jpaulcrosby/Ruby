############################################################
#
#  Name:            Paul Crosby
#  Assignment:      Connect Four
#  Date:            3/11/2019
#  Class:           CIS 282
#  Description:     First player to connect 4 horizontally, vertically, or diagonally wins
#
############################################################

##### PART 1: FUNCTIONS #####

# method to build the board
def build_board(the_board_parameter)

  system("clear")
  puts "1 2 3 4 5 6 7 8"

  the_board_parameter.each do |row|

    current_index = 0

    while current_index < row.length

      if row[current_index] == 0
        print "* "
      elsif row[current_index] == 1
        print "X "
      elsif row[current_index] == -1
        print "O "
      end

      current_index+=1
    end
    puts
  end
end

# method for dropping the chip
def computer_1_drop_chip(board_parameter)

  system("clear")
  counter = 0
  computer_selection = rand(1..8) - 1

  board_parameter.each do | row |

    if row[computer_selection] == 0
      counter+=1
    end

  end

  board_parameter[counter - 1][computer_selection] = 1
  build_board(board_parameter)
  sleep(1)
end

# method for computer dropping the chip
def computer_2_drop_chip(board_parameter)

  system("clear")
  counter = 0
  computer_selection = rand(1..8) - 1

  board_parameter.each do | row |

    if row[computer_selection] == 0
      counter+=1
    end

  end

  board_parameter[counter - 1][computer_selection] = -1
  build_board(board_parameter)
  sleep(1)
end

# method for finding four in a (literal) row
def four_in_row (the_board_parameter)

  # did I or the computer win horizontally
  row_count = (the_board_parameter.length - 1)
  score = 0
  previous_value = 0

  while row_count >= 0 && score < 4 && score > -4
    score = 0
    col_count = 0
    while col_count <= 7 && score < 4 && score > -4

      current_value = the_board_parameter[row_count][col_count]

      if col_count != 0
        previous_value = the_board_parameter[row_count][col_count - 1]
      end

      if (current_value > 0) && (current_value == previous_value)
        score += 1
      elsif (current_value < 0) && (current_value == previous_value)
        score -= 1
      elsif (current_value != previous_value) && (current_value != 0)
        score = current_value
      end

      col_count += 1
    end

    row_count -= 1
  end

  return score
end

# method for finding four in a column
def four_in_column(the_board_parameter)

  col_count = 0
  score = 0
  previous_value = 0

  while (col_count <= 7) && (score < 4)

    row_count = 7
    while (row_count >= 0) && (score < 4)

      # make my life easier
      current_value = the_board_parameter[row_count][col_count]

      if row_count < 7
        previous_value = the_board_parameter[row_count + 1][col_count]
      end

      if (row_count == 7) && (current_value == 1)

        score = 0
        score += 1

      elsif (row_count == 7) && (current_value == -1)
        score = 0
        score -= 1

      end

      if (row_count < 7) && (current_value == 1)

        if current_value == previous_value

          score += 1

        elsif current_value != previous_value

          score = current_value

        end

      elsif (row_count < 7) && (current_value == -1)
        if current_value == previous_value

          score -= 1

        elsif current_value != previous_value

          score = current_value

        end
      end
      row_count -= 1
    end

    col_count += 1
  end

  return score
end

# method for finding four diagonally
def four_diagonal(the_board_parameter)

  # This iteration starts in the bottom left and moves to the top right, then it bumps up to the next COLUMN and does 4 in a row again

  #------
  #Bottom left going up and to the right
  #------
  score = 0

  total_rows = 8
  total_cols = 8
  row_count = 7
  col_count = 0
  prev_val = 0

  while (total_cols >= 0) && (score < 4)
    while (row_count >= 0 && col_count < total_cols) && (score < 4)

      current_value = the_board_parameter[row_count][col_count]

      if (current_value != 0) && (current_value == prev_val || prev_val == 0)
        score+=current_value
      elsif (current_value != 0)
        score = current_value
      else
        score = 0
      end

      #puts "at [#{col_count}, #{row_count}] the current value is #{current_value} and the score is #{score}"

      row_count -= 1
      col_count += 1
      prev_val = current_value

    end
    total_rows -= 1
    total_cols -= 1
    col_count = 0
    row_count = total_rows - 1
  end
  #puts "The score is now #{score}"

  #------
  #Bottom Left going right and up
  #------
  total_rows = 8
  total_cols = 8
  remaining_cols = 7
  row_pos = 7
  col_pos = 1
  prev_val = 0

  if score < 4
    score = 0
  end

  while remaining_cols > 0 && (score < 4)
    while(row_pos >= 0 && col_pos < total_cols) && (score < 4)
      current_value = the_board_parameter[row_pos][col_pos]

      if (current_value != 0) && (current_value == prev_val || prev_val == 0)
        score += current_value
      elsif (current_value != 0)
        score = current_value
      else
        score = 0
      end

      #puts "at [#{col_count}, #{row_count}] the current value is #{current_value} and the score is #{score}"

      row_pos -= 1
      col_pos += 1
      prev_val = current_value
    end
    remaining_cols -= 1
    row_pos = total_rows - 1
    col_pos = total_cols - remaining_cols
  end
  #puts "The score is now #{score}"

  #-------
  #Starting from the top left going right and down
  #-------

  total_rows = 8
  total_cols = 8
  max_cols = 8
  max_rows = 8
  row_pos = 0
  col_pos = 0
  prev_val = 0

  if score < 4
    score = 0
  end

  while (total_cols >= 0) && (score < 4)
    while (row_pos < max_rows && col_pos < max_cols) && (score < 4)

      current_value = the_board_parameter[row_pos][col_pos]

      if (current_value != 0) && (current_value == prev_val || prev_val == 0)
        score+=current_value
      elsif (current_value != 0)
        score = current_value
      else
        score = 0
      end

      #puts "at [#{col_count}, #{row_count}] the current value is #{current_value} and the score is #{score}"

      row_pos += 1
      col_pos += 1
      prev_val = current_value

    end
    total_rows -= 1
    total_cols -= 1
    col_pos = max_cols - total_cols
    row_pos = 0
  end
  #puts "The score is now #{score}"

  #-------
  #Starting from the top left going down and right
  #-------

  total_rows = 8
  total_cols = 8
  max_cols = 8
  max_rows = 8
  row_pos = 1
  col_pos = 0
  prev_val = 0

  if score < 4
    score = 0
  end

  while (total_cols >= 0) && (score < 4)
    while (row_pos < max_rows && col_pos < max_cols) && (score < 4)

      current_value = the_board_parameter[row_pos][col_pos]

      if (current_value != 0) && (current_value == prev_val || prev_val == 0)
        score+=current_value
      elsif (current_value != 0)
        score = current_value
      else
        score = 0
      end

      #puts "at [#{col_count}, #{row_count}] the current value is #{current_value} and the score is #{score}"

      row_pos += 1
      col_pos += 1
      prev_val = current_value

    end
    total_rows -= 1
    total_cols -= 1
    col_pos = 0
    row_pos = max_rows - total_rows
  end
  #puts "The score is now #{score}"

  return score
end

##### END PART 1: FUNCTIONS #####


##### PART 2: VARIABLES #####

# initialize the variable
the_board = [
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0]
]

continue = true
my_turn = true
# the initial blank board
build_board(the_board)


##### PART 3: GAME BEGINS #####

# this will execute until somebody wins
while continue



  # my turn
  while my_turn && continue

    computer_1_drop_chip(the_board)
    my_turn = false
  end

  # win check
  if four_in_row(the_board) >= 4
    continue = false
    puts "Computer #1 wins!"
  elsif four_in_column(the_board) >= 4
    continue = false
    puts "Computer #1 wins!"
  elsif four_diagonal(the_board) >= 4
    continue = false
    puts "Computer #1 wins!"
  end

  # computer #2 turn
  while !my_turn && continue
    computer_2_drop_chip(the_board)
    my_turn = true
  end

  # win check
  if four_in_row(the_board) <= -4
    continue = false
    puts "Computer #2 wins!"
  elsif four_in_column(the_board) <= -4
    continue = false
    puts "Computer #2 wins!"
  elsif four_diagonal(the_board) <= -4
    continue = false
    puts "Computer #2 wins!"
  end


end