############################################################
#
#  Name:            Paul Crosby
#  Assignment:      Acronym
#  Date:            3/11/2019
#  Class:           CIS 282
#  Description:     Transforms phrases into acronyms
#
############################################################


# declare function
def acronym(phrase)
  # separate phrase into array
  split_phrase = phrase.split(" ")
  # will receive our acronym
  acronym = ""
  # counter for loop
  count = 0
  # loop through and grab each letter
  while count < split_phrase.length
    acronym += split_phrase[count][0]
    count+=1
  end
  # return results
  return acronym
end

print "Enter a phrase to turn into an acronym: "
user_phrase = gets.chomp

puts acronym(user_phrase).upcase