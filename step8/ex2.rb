def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
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
  puts "The students of Villians Academy"
  puts "-----------------------"
end


def print_selected(students)
  puts "What is the first letter of the student name you want to check?"

  letter = gets.chomp.downcase!
  puts "List of students who's name starts with #{letter}"
  result= students.select{|student|student[:name][0].downcase.start_with?(letter)}

result.each_with_index do |student, index|
  puts "#{index + 1} #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print_selected(students)
print_footer(students)
# note that above we are now passing the students variable to the methods as an argument (called names in both cases). This is becasue the methods dont have access to local variables defined outside them.
