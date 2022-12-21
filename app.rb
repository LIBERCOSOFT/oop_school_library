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

  def start_app
    puts 'Welcome to School Library App!'
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
    when '3'
      create_person
    when '4'
      create_book
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
end

puts App.new.start_app
