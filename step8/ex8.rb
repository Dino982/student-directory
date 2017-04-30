COHORTS = [:jan, :feb, :mar, :apr, :may, :jun, :jul, :aug, :sep, :oct, :nov, :dec]

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  @students = []
  name = gets.chomp # 1st name
  while !name.empty? do
    get_cohort(name)
    single(@students)
    name = gets.chomp
  end
  @students
end

def get_cohort(name)
  puts "Which cohort (Jan - Dec) is #{name} from?"
  @cohort = gets.chomp
  if COHORTS.include?(@cohort.downcase.to_sym)
    @students << {name: name, cohort: @cohort.downcase.to_sym}
  else
    puts "Invalid. Cohort not identified."
    @students << {name: name, cohort: "Unknown"}
  end
end

def single(names)
  if names.size == 1
    puts "There is 1 student. Add additional entries?"
  else
    puts "There are #{names.count} students in the directory"
  end
end

def print_header
  puts "The Students of Villians Academy".center(50)
  puts "-" * 30.center(50)
end

def print_with_index(names)
  names.each_with_index do |student, index|
    puts "#{index +1} #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def group_by_cohort(students)
  students.sort! {|a, b| a[:cohort] <=> b[:cohort]}
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print_with_index(group_by_cohort(students))
print_footer(students)
# note that above we are now passing the students variable to the methods as an argument (called names in both cases). This is becasue the methods dont have access to local variables defined outside them.
