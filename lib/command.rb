class Command
  
  def run
    welcome
  end

  def welcome
    puts `clear`
    puts ascii.asciify('Welcome to Bookshelf!')
    login
  end

  def login
    puts 'Please enter your username'
    username = gets.chomp
    if username == ''
      puts '🤔 Blank Spaces? Are you a Taylor Swift fan?'
      login
    else
      @user = User.find_or_create_by(username: username)
      @current_user = @user.username
      sleep(1)
      puts `clear`
      personal_welcome
    end
  end

  def logo_banner
    puts `clear`
    puts ascii.asciify('Bookshelf')
  end

  def personal_welcome
    puts ascii.asciify("Hello #{@user.username}")
    menu_run
  end

  def main_menu
    logo_banner
    puts '--------Main Menu---------'
    prompt.select(
      'Please select an option',
      ['Search for books', 'View your booklist', 'Logout', 'Exit']
    )
  end

  def menu_run
    menu_choice = main_menu
    case menu_choice
    when 'Search for books'
      get_book_query_from_user
    when 'View your booklist'
      booklist
    when 'Logout'
      login
    when 'Exit'
      goodbye
    end
  end

  def goodbye
    puts `clear`
    puts ascii.asciify('See you soon')
    puts ascii.asciify('Happy Reading!!')
  end

  def get_book_query_from_user
    logo_banner
    puts '---------Please enter a keyword to search for books ---------'
    book_query = gets.chomp
    if book_query == ''
      puts '🤔 Sorry didnt catch that'
      get_book_query_from_user
    else
      get_books_from_api(book_query)
    end
  end

  def booklist
    logo_banner
    user = User.find_by(username: @current_user)
    if user.books.empty?
      puts 'Your booklist is currently empty. 😩'
    else
      user.books.each { |book| puts "📚 '#{book.title}', written by #{book.author}, & published by #{book.publisher}"}
    end
    end_prompt = prompt.select(
      '',
      ['------ 📚 Add More Books 📚 ------', '------ 🔙 Return to Main Menu ------']
    )
    if end_prompt == '------ 📚 Add More Books 📚 ------'
      get_book_query_from_user
    else
      menu_run
    end
  end

  def show_query_books(query_return)
    books = query_return.each_with_index.map do |book, index|
      "📚 '#{book[:title]}', written by #{book[:authors][0]}, & published by #{book[:publisher]}"
    end
    book_selection = prompt.select(
      'Please select a book to add to your reading list',
      books, '------ 🔙 Return to Main Menu ------')
    if book_selection == '------ 🔙 Return to Main Menu ------'
      menu_run
    else
      index = books.find_index(book_selection)
      @book_obj = query_return[index]
      @book = Book.find_or_create_by(title: @book_obj[:title], author: @book_obj[:authors][0], publisher: @book_obj[:publisher])
      UserBook.find_or_create_by(user_id: @user.id, book_id: @book.id)
      book_added
    end
  end

  def book_added
    puts ascii.asciify('Book Added 👍👍👍👍👍👍👍👍👍')
    booklist
  end

  def prompt
    TTY::Prompt.new
  end

  def ascii
    Artii::Base.new
  end
end
