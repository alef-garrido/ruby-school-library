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
