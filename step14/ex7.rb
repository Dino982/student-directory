
require 'csv'
@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a csv file"
  puts "4. Load the list from a csv file"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    puts "Which file do you want to save to?"
    save_students
  when "4"
    puts "Which file do you want to load from?"
    try_load_students(choose_file)
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    add_student(name)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def add_student(name, cohort= :november)
  @students << {name: name, cohort: cohort.to_sym}
end



def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-" * 40
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  filename = choose_file
  CSV.open(filename, "w") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end
  puts "Student successfully saved"
end

def load_students(filename)
  CSV.foreach(filename) do |line|
    name, cohort = line
    add_student(name, cohort)
  end
  puts "Students from '#{filename}' successfully loaded"
end

def try_load_students(filename = ARGV.first || "students.csv")
  if File.exist?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def choose_file
  puts "Select file"
  puts "Filename: "
  filename = STDIN.gets.chomp
  filename.empty? ? "students.csv" : filename
end


try_load_students
interactive_menu
