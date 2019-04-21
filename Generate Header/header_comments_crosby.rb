############################################################
#
#  Name:            Paul Crosby
#  Assignment:      Header Comments
#  Date:            1/16/19
#  Class:           CIS 282
#  Description:     Ask for user input to create a standard header comment for files
#
############################################################

# Retrieve header information through a series of prompts
print "What is your full name? "
name = gets.chomp
print "What is the name of this assignment? "
assignment = gets.chomp
print "What is today's date? "
date = gets.chomp
print "What is the class number? "
class_number = gets.chomp
print "Briefly describe what your program will do: "
description = gets.chomp

# Generate top and bottom row of pound signs and store in a single variable
pound_signs = '#'
while (pound_signs.length < 60)
  pound_signs += '#'
end

# print out header onto the screen
print "#{pound_signs} \n#\n#  Name:            #{name}\n#  Assignment:      #{assignment}\n#  Date:            #{date}\n#  Class:           #{class_number}\n#  Description:     #{description}\n#\n#{pound_signs}"
