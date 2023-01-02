#!/usr/bin/env ruby

require_relative './app'

class Main
  def initialize(app)
    @app = app
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
  
    menu_option = @app.user_input
    option_selection(menu_option)
  end

  def option_selection(option)
    case option
    when '1' then @app.list_books
    when '2' then @app.list_people
    when '3' then @app.create_person
    when '4' then @app.create_book
    when '5' then @app.create_rentals
    when '6' then @app.list_rentals_per_id
    when '7' then puts 'Thank you for using this app!'
    else puts 'Invalid number selected, Please pick from 1 - 7'
    end
    start_app unless option == '7'
  end

end

app = App.new
main = Main.new(app)
main.start_app
