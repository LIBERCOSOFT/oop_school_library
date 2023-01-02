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

  def user_input
    gets.chomp
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    person_type = user_input

    case person_type
    when '1' then create_student
    when '2' then create_teacher
    else
      puts 'Invalid number entered, Please select between 1 - 2'
    end
  end

  def create_student
    print 'Age: '
    age = user_input
    print 'Name: '
    name = user_input
    print 'Has parent permission? [Y/N]: '
    parent_permission = user_input
    if %w[Y y YES yes].include?(parent_permission)
      parent_permission = true
    elsif %w[N n NO no].include?(parent_permission)
      parent_permission = false
    end
    @person.push(Student.new(age, name, parent_permission))
    puts 'Student created successfully!'
  end

  def create_teacher
    print 'Age: '
    age = user_input
    print 'Name: '
    name = user_input
    print 'Specialization: '
    specialization = user_input
    @person.push(Teacher.new(age, name, specialization))
    puts 'Teacher created successfully!'
  end

  def create_book
    print 'Title: '
    title = user_input
    print 'Author: '
    author = user_input

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
    book_selection = user_input.to_i
    puts "\n"

    puts 'Select a person from the following list by number (not id)'
    @person.each_with_index do |per_person, index|
      puts "#{index}) #{[per_person.class]} Name: #{per_person.name}, ID: #{per_person.id}, Age: #{per_person.age}"
    end
    person_selection = user_input.to_i
    puts "\n"

    print 'Date: '
    date = user_input

    @rentals.push(Rental.new(date, @person[person_selection], @books[book_selection]))
    puts 'Rental created successfully'
  end

  def list_rentals_per_id
    print 'ID of person: '
    person_id = user_input.to_i

    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book #{rental.book.title} by #{rental.book.author}" if rental.person.id == person_id
    end
  end
end
