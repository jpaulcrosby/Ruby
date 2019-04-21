############################################################
#
#  Name:            Paul Crosby
#  Assignment:      Right Triangle
#  Date:            1/25/19
#  Class:           CIS 282
#  Description:     Generates three triangles with dimensions determined by user input
#
############################################################

# Part 1: Star Triangle

=begin

###### PART 2: STAR TRIANGLE PSEUDO CODE ######

1. Get user input
2. Create a while loop to validate input
3. If the user enters a positive number, start building the triangle
4. if star triangle size is equal to one, print out a single star and break out of loop
5. is star triangle size is 2 print out * on one line and ** on next
6. else - for all other numbers, and the first two rows of stars, declare an empty string to hold the space between stars
7. if the length of the spacer string plus 3 (to account for two stars) is less than the size of the triangle, increment the spacer by a spacer per loop to push the stars further apart
8. Once the spacer + 3 is NOT less than triangle_size, it is time to print the last row!
9. break out of the conditional statements

=end

# Get user input
print "Please enter a number greater than or equal to 1 for the star triangle: "
triangle_size  = gets.to_i

# Validate user input
while triangle_size < 1
  print "Invalid Input: Please enter a positive number: "
  triangle_size = gets.to_i
end

# Build triangle
if triangle_size >= 1
  if triangle_size == 1
    puts "*"
  elsif triangle_size == 2
    puts "*"
    puts "**"
  else
    puts "*"
    puts "**"
    spacer = ""
    while spacer.length + 3 < triangle_size
      spacer += " "
      puts "*#{spacer}*"
    end
    puts "*" * triangle_size
  end
end
puts
puts

# Part 2: Number triangle
=begin

######PART 2: NUMBER TRIANGLE - PSEUDO CODE######


10. initiate a count variable
11. Also create an empty variable that will store a "stringified" version of the sequence of numbers in each row
12. while the count is less than or equal to the number entered by the user start iteration.
13. If number is greater than 1 and the count is less than the number entered (so we dont make a triangle that is too big) enter a loop which appends a 0 to numbers less than or equal to 9 to ensure proportional scaling of triangle and stores them to a variable which uses an assignment operator to build string of numbers. Once we get to numbers greater than 9, no need to prepend a 0.
14. Print out the stringed number for each iteration and increment count variable

=end

# Build Triangle (this is the while within a while version)
puts "PART 2 - NESTED LOOP"
count = 1
stringed_number = ""
while count <= triangle_size

  while (count > 1) && (count < triangle_size)
    # Included this line so single digit numbers would scale proportionately to double digit numbers
    if count <= 9
      stringed_number += count.to_s
    else
      stringed_number += count.to_s
    end
    puts stringed_number
    count+=1
  end

  if count <=9
    stringed_number += count.to_s
  else
    stringed_number += count.to_s
  end
  puts stringed_number
  count+=1

end
puts
puts


=begin
#### I am leaving my original solution here because it is much less code and easier to understand ####

SINGLE LOOP SOLUTION

print "Enter a number: "
triangle_size = gets.to_i

count = 1
store_all = ""
while count <= triangle_size
  if count <= 9
    store_all += "0#{count}"
  else
    store_all += count.to_s
  end
  puts store_all
  count+=1
end
=end

# Extra Credit

=begin

######EXTRA CREDIT PSEUDO CODE######

15. Since the triangle starts on the other side and works its way in, we are going to create a count variable that starts off at the value of the user input and works its way down
16. if the star size is one star print out 1 star, and end program
17. otherwise we are going to enter a some loops
18. the first loop makes sure the count = the the user input. (Means it is the first row, but not a single rowed "triangle"
19. print our the space times count abd output a star and decrement
20. while the count + 1 equals the user input (the second row), print out two stars and decrement.
21. Initiate a new variable that will represent the space between the stars
22. initiate a loop where the count + 2 is less than or equal to the star triangle size and the count is greater than 1
23. puts out the count times the space (" ") and add the first star. then concatenate that to the the space between the bars times a space and add the second star
24. decrement the count.
25. increment the space.

=end

puts "EXTRA CREDIT: REVERSE TRIANGLE"
# build the triangle.
count = triangle_size
if triangle_size == 1
  print "*"
else
  while (count == triangle_size) && (count != 1)
    puts " " * count + "*"
    count -= 1
    while count + 1 == triangle_size
      puts " " * count + "**"
      count -= 1
      space_between_stars = 1
      while ((count + 2) <= triangle_size) && (count > 1)
        puts " " * count + "*" + (" " * space_between_stars) + "*"
        count -=1
        space_between_stars+=1
      end
    end
    if triangle_size > 2
      puts " " + ("*" * triangle_size)
    end
  end
end