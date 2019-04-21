############################################################
#
#  Name:            Paul Crosby
#  Assignment:      Coins assignment
#  Date:            3/11/2019
#  Class:           CIS 282
#  Description:     Calculates total value of quarters, nickels, dimes, and pennies.
#
############################################################
puts
print "Please Enter the number of Quarters: "
number_quarters = gets.to_i
value_quarters = number_quarters * 0.25

print "Please Enter the number of Dimes: "
number_dimes = gets.to_i
value_dimes = number_dimes * 0.1

print "Please Enter the number of Nickels: "
number_nickels = gets.to_i
value_nickels = number_nickels * 0.05

print "Please Enter the number of Pennies: "
number_pennies = gets.to_i
value_pennies = number_pennies * 0.01

sum = format("$%.2f", value_quarters + value_dimes + value_nickels + value_pennies)
puts
puts "You have #{number_quarters} quarters, #{number_dimes} dimes, #{number_nickels} nickels, and #{number_pennies} pennies for a total of #{sum}"