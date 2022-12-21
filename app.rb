#!/usr/bin/env ruby

require_relative './book_object'
require_relative './teacher_object'
require_relative './student_object'
require_relative './rental_object'

class App
  def initialize
    @books = []
    @person = []
    @rentals = []
  end

  puts 'Welcome to School Library App!'

  def start_app
    puts "\n"
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'

    menu_option = gets.chomp
    option_selection(menu_option)
  end

  def option_selection(option)
    case option
    when '1'
      list_books
      start_app
    when '2'
      list_people
      start_app
    when '3'
      create_person
      start_app
    when '4'
      create_book
      start_app
    when '5'
      create_rentals
    when '7'
      nil
    else
      puts 'Invalid number selected, Please pick from 1 - 7'
      menu_option = gets.chomp
      option_selection(menu_option)
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    person_type = gets.chomp

    case person_type
    when '1'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp
      if %w[Y y YES yes].include?(parent_permission)
        parent_permission = true
      elsif %w[N n NO no].include?(parent_permission)
        parent_permission = false
      end
      @person.push(Student.new(age, name, parent_permission))
      puts 'Student created successfully!'
    when '2'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp
      @person.push(Teacher.new(age, name, specialization))
      puts 'Teacher created successfully!'
    else
      puts 'Invalid number entered, Please select between 1 - 2'
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    @books.push(Book.new(title, author))
    puts 'Book created successfully'
  end

  def list_books
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_people
    @person.each do |per_person|
      puts "#{[per_person.class]} Name: #{per_person.name}, ID: #{per_person.id}, Age: #{per_person.age}"
    end
  end

  def create_rentals
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_selection = gets.chomp.to_i
    puts "\n"

    puts 'Select a person from the following list by number (not id)'
    @person.each_with_index do |per_person, index|
      puts "#{index}) #{[per_person.class]} Name: #{per_person.name}, ID: #{per_person.id}, Age: #{per_person.age}"
    end
    person_selection = gets.chomp.to_i
    puts "\n"

    print 'Date: '
    date = gets.chomp

    @rentals.push(Rental.new(date, @person[person_selection], @books[book_selection]))
    puts 'Rental created successfully'
  end
end

puts App.new.start_app
