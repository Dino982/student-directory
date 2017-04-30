# Put all the students into an array
students = [
"Dr. Hannibal Lecter",
"Darth Vader",
"Nurse Ratched",
"Michael Corleone",
"Alex DeLarge",
"The Wicked Witch of the West",
"Terminator",
"Freddy Krueger",
"The Joker",
"Joffrey Baratheon",
"Norman Bates"
]

def print_header
  puts "The students of Villians Academy"
  puts "-----------------------"
end

def print(names)
names.each do |name|
  puts name
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# nothing happens until we call method
print_header
print(students)
print_footer(students)
# note that above we are now passing the students variable to the methods as an argument (called names in both cases). This is becasue the methods dont have access to local variables defined outside them. 
