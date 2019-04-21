############################################################
#
#  Name:            Paul Crosby
#  Assignment:      Leap Years
#  Date:            3/11/2019
#  Class:           CIS 282
#  Description:     Gets Leap Years Between Two Dates
#
############################################################

def get_leap_years(from, to)
  count = 0
  leap_years = []
  all_years = []
  while from <= to
    all_years << from
    from += 1
  end

  all_years.each do | year |
    if year % 400 == 0
      leap_years << year
    elsif (year % 100 != 0) && (year % 4 == 0)
      leap_years << year
    end
  end
return leap_years


end

print "Enter start year: "
start_year = gets.to_i

print "Enter end year: "
end_year = gets.to_i

print "Leap Years between #{start_year} and #{end_year}: #{get_leap_years(start_year, end_year)}"