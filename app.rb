require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    puts "\n"
    @books.each_with_index do |book, index|
      puts "#{index + 1} Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_people
    puts "\n"
    @people.each_with_index do |person, index|
      puts "#{index + 1} [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_student
    print 'Age: '
    student_age = gets.chomp.to_i
    print 'Name: '
    student_name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission_response = gets.chomp
    student_permission = permission_response != 'N'

    new_student = Student.new(student_age, student_name, parent_permission: student_permission)
    puts 'Person created succesfully' if new_student.instance_of?(Student)
    people << new_student unless people.include?(new_student)
  end

  def create_teacher
    print 'Age: '
    teacher_age = gets.chomp.to_i
    print 'Name: '
    teacher_name = gets.chomp
    print 'Specialization: '
    teacher_specialization = gets.chomp

    new_teacher = Teacher.new(teacher_specialization, teacher_age, teacher_name)
    puts 'Person created succesfully' if new_teacher.instance_of?(Teacher)
    people << new_teacher unless people.include?(new_teacher)
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_selection = gets.chomp.to_i
    case person_selection
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Wrong value. Please try again :)'
    end
  end

  def option_run(input)
    case input
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals_by_id
    else
      puts 'Wrong value. Verify selection'
    end
  end
end
