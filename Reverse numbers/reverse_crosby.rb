############################################################
#
#  Name:            Paul Crosby
#  Assignment:      Reverse Digits
#  Date:            3/11/2019
#  Class:           CIS 282
#  Description:     Reverse Digits with a method without type conversion
#
############################################################

# declare a function
def reverse_digit(user_number)

  # Want to make sure this can handle positive and negative integers
  negative = false
  if user_number < 0
    negative = true
  end

  # get the absolute value of the integer
  user_number = user_number.abs

  # Initialize a variable that will store my reverse number
  reverse_number = 0

  # I am going to iterate down by dividing user_number by 10
  while user_number > 0
    # the % 10 will always give me the last digit of the integer sequence
    next_number = user_number % 10
    # build the reverse number in a way that adds rather than concatenates
    reverse_number = (reverse_number * 10) + next_number
    # this is my counter to avoid an infinite loop
    user_number = user_number / 10
  end


  if negative == false
    return reverse_number
  else
    return reverse_number - (reverse_number * 2)
  end

end

# User input
print "Give me an integer: "
user_input = gets.to_i

# Call function
puts reverse_digit(user_input)