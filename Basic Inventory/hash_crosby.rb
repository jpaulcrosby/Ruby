############################################################
#
#  Name:            Paul Crosby
#  Assignment:      Hash assignment
#  Date:            3/09/2019
#  Class:           CIS 282
#  Description:     Hash Assignment
#
############################################################

# Load the file with our products data
products_file = File.open("products.txt", "r+")

# Prompt the user to make a selection
puts
puts "1. View all products"
puts "2. Add a new product" 
puts "3. Delete a product"
puts "4. Update a product"
puts "5. View highest priced product"
puts "6. View lowest priced product"
puts "7. View sum of all product prices"
puts "8. Exit"
puts
print "Please enter a number to make a selection: "

# Save user selection to a variable
selection = gets.to_i

# Validate User Input
while selection > 8 || selection < 1
  print "You either did not enter a number or you did not enter a number 1-8. Please make a selection using 1 - 8"
  selection = gets.to_i
end


# Initialize an empty hash
database = {}

# The initial placeholder data comes from products.txt, which is located in the same directory as this file.
until products_file.eof?
  # get the current line of the file. Each line now is an array
  record = products_file.gets.chomp.split(",")
  # assign to key value pairs
  database[record[0].to_i] = [record[1], record[2] % '%.2f']
end

# Find the length of the longest description so that I can have a flexible layout
longest_description = 0

database.each_value do | current_value |
  if current_value[0].length > longest_description
    longest_description = current_value[0].length
  end
end

# In the event that the longest description is less than 13 (more likely than not), need to make sure that the alignment value is at least 13
if longest_description.to_i >= 13
  alignment_value = longest_description + 3
else
  alignment_value = 13
end

# Because I dont want the program to end until the user chooses to exit, I am putting this into a loop
while selection >= 1 && selection < 8

  # I learned about this in the code academy lessons, so I assume that I am allowed to use it?
  case selection

  # 1. View all products
  when 1

    # generate header
    puts "Item".ljust(6, " ") + "Description".ljust(alignment_value, " ") + "Price".rjust(6, " ")
    puts "----".ljust(6, " ") + "-----------".ljust(alignment_value, " ") + "------".rjust(6, " ")

    # populate tabular layout with data
    database.keys.sort.each do | key |
      puts key.to_s.ljust(6, " ") + database[key][0].to_s.ljust(alignment_value, " ") + database[key][1].to_s.rjust(6, " ")
    end

  # 2. Add a new product
  when 2
    # need a hash key...
    hash_key = rand(100..999)

    # ...and that hash key needs to be unique
    while database.key?(hash_key)
      hash_key = rand(100..999)
    end

    # get description of new product from user
    puts
    print "What is the name of your product? "
    product_name = gets.chomp

    while product_name.length == 0
      puts
      print "You need to enter a product name: "
      product_name = gets.chomp
    end

    # get price of new product from user
    puts
    print "What is the price of your product? "
    product_price = '%.2f' % gets.to_f

    while product_price.to_f <= 0
      puts
      print "You need to enter a product price: "
      product_price = '%.2f' % gets.to_f
    end

    database[hash_key] = [product_name, product_price]
    print "#{product_name} with a price of $#{product_price} added to your database."

  # 3. Delete a product
  when 3

    # generate header
    puts "Item".ljust(6, " ") + "Description".ljust(alignment_value, " ") + "Price".rjust(6, " ")
    puts "----".ljust(6, " ") + "-----------".ljust(alignment_value, " ") + "------".rjust(6, " ")

    # populate tabular layout with data
    database.keys.sort.each do | key |
      puts key.to_s.ljust(6, " ") + database[key][0].to_s.ljust(alignment_value, " ") + database[key][1].to_s.rjust(6, " ")
    end

    puts
    puts

    # Figure out which item user wants to delete
    print "Using the record's ID number, please select an item to delete: "
    delete_id = gets.to_i

    # Delete specified record if it exists. If ID doesnt exist, notify user.
    if database.has_key?(delete_id)
      database.delete(delete_id)
      puts "Just deleted #{delete_id} from the database."
    else
      puts "Sorry, that ID doesn't exist. Nothing deleted."
    end

  # 4. Update a product
  when 4

    # generate header
    puts "Item".ljust(6, " ") + "Description".ljust(alignment_value, " ") + "Price".rjust(6, " ")
    puts "----".ljust(6, " ") + "-----------".ljust(alignment_value, " ") + "------".rjust(6, " ")

    # populate tabular layout with data
    database.keys.sort.each do | key |
      puts key.to_s.ljust(6, " ") + database[key][0].to_s.ljust(alignment_value, " ") + database[key][1].to_s.rjust(6, " ")
    end

    puts
    puts

    # User input to determine item to be updated.
    print "Using the record's ID number, please select an item to update: "
    update_id = gets.to_i
    puts
    # Updates specified record, if it exists. If ID doesnt exist, notify user.
    if database.has_key?(update_id)
      print "Record ID##{update_id} is/are #{database[update_id][0]} that cost $#{database[update_id][1]}. Please enter an updated description of the product: "
      update_description = gets.to_s.chomp
      print "Please enter the updated price: "
      update_price = gets.to_f
      database[update_id] = [update_description, update_price]
      puts "Congrats. Record successfully updated"
    else
      puts "Sorry, that ID doesn't exist. Nothing updated."
    end

  # 5. Get most expensive item
  when 5

    # Initialize variables, so that they are in the global scope (right?)
    highest_value = 0
    highest_description = ""

    # Loop through each value to determine most expensive item.
    database.each_value do | current_value |
      # change initialized variables from above if my condition is true
      if current_value[1].to_f > highest_value
        highest_value = current_value[1].to_f
        highest_description = current_value[0]
      end

    end

    # Required meaningful statement:
    puts "The highest price item is: #{highest_description} at a cost of $#{highest_value}"

  # 6. Get cheapest item (I realize the initializing a value at 1000 is a bit of a hack. Having a mental block on this)
  when 6

    # Same process as getting the highest value - except reversed
    lowest_value = 1000
    lowest_description = ""
    database.each_value do | current_value |

      if current_value[1].to_f < lowest_value
        lowest_value = current_value[1].to_f
        lowest_description = current_value[0]
      end

    end
    # Required meaningful statement:
    puts "The lowest price item is: #{lowest_description} at a cost of $#{lowest_value}"

  # 7. Get the total cash value of inventory
  when 7

    # initialize sum variable
    sum = 0

    # loop through database with an assignment operator doing all the addition
    database.each_value do | current_value |
      sum+=current_value[1].to_f
    end

    puts "The total value of all items in inventory is $#{sum.round(2) }"
  end

  puts
  puts

  # Execute the entire block again unless user selects 8.

  puts "1. View all products"
  puts "2. Add a new product"
  puts "3. Delete a product"
  puts "4. Update a product"
  puts "5. View highest priced product"
  puts "6. View lowest priced product"
  puts "7. View sum of all product prices"
  puts "8. Exit"
  puts
  print "Please make another selection (1-8): "
  selection = gets.to_i

  while selection > 8 || selection < 1
    print "You either did not enter a number or you did not enter a number 1-8. Please make a selection using 1 - 8: "
    selection = gets.to_i
  end
  puts

end

# create a new connection to file with correct mode
products_write = File.open("products.txt", "w+")

# write to the file line by line, making sure to keep with original format
database.each do | product_key, record|
  products_write.puts "#{product_key},#{record[0]},#{record[1]}"
end

# close write file
products_write.close

# The End
puts "Program will end now."

# close read file
products_file.close