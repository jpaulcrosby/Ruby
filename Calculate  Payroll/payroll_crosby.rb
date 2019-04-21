############################################################
#
#  Name:            Paul Crosby
#  Assignment:      Payroll Application
#  Date:            1/16/19
#  Description:     Calculates and prints payroll information
#
############################################################

print "First Name: "
first_name = gets.chomp
print "Last Name: "
last_name = gets.chomp
full_name = first_name + " " + last_name
print "Number of hours worked in a week: "
weekly_hours = gets.to_i
print "Hourly rate (Please omit $): "
hourly_rate = gets.to_f
print "Federal tax rate (e.g. 20): "
federal_tax_rate = gets.to_f.round(2)
print "State tax rate (e.g. 9): "
state_tax_rate = gets.to_f.round(2)

federal_withholding = (federal_tax_rate/100) * (weekly_hours * hourly_rate)
state_withholding = (state_tax_rate/100) * (weekly_hours * hourly_rate)

print "\nEmployee Name: #{full_name} \n"
print "Hours Worked: #{weekly_hours} \n"
print "Pay Rate: $#{hourly_rate} \n"
print "Gross Pay: $#{weekly_hours * hourly_rate} \n"
print "Deductions: \n"
print "\tFederal Withholding (#{federal_tax_rate}%): $#{federal_withholding.round(2)}\n"
print "\tState Withholding (#{state_tax_rate}%): $#{state_withholding.round(2)}\n"
print "\tTotal Deductions: $#{federal_withholding + state_withholding.round(2)}\n"
print "Net Pay: $#{((weekly_hours*hourly_rate) - federal_withholding - state_withholding).round(2)}"
