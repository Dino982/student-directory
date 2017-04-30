

def input_students
  students = []
  puts "Please enter the names of the students"
  #get first names
  name = gets.chomp

  puts "To finish, just hit return twice"
  # create an empty array

 # get name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villians Academy".center(50)
  puts "-" * 30.center(50)
end


def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header

print_footer(students)
# note that above we are now passing the students variable to the methods as an argument (called names in both cases). This is becasue the methods dont have access to local variables defined outside them.
