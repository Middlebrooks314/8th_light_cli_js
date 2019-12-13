class DisplayCommand

  # logic
  def run
    welcome
  end

  # display
  def welcome
    puts `clear`
    puts ascii.asciify('Welcome to Bookshelf!')
    login_prompt
  end

  # display
  def login_prompt
    puts 'Please enter your username'
    username = gets.chomp
    if username == ''
      puts '🤔 Blank Spaces? Are you a Taylor Swift fan?'
      login_prompt
    else
      login_find_or_create_user(username)
    end
  end

  # logic
  def login_find_or_create_user(username)
    @user = User.find_or_create_by(username: username)
    @current_user = @user.username
    menu_run
  end

  # display
  def logo_banner
    puts `clear`
    puts ascii.asciify('Bookshelf')
  end

  # display
  def main_menu
    logo_banner
    puts '--------Main Menu---------'
    prompt.select(
      'Please select an option',
      ['Search for books', 'View your booklist', 'Logout', 'Exit']
    )
  end

  # logic
  def menu_run
    menu_choice = main_menu
    case menu_choice
    when 'Search for books'
      book_query_input
    when 'View your booklist'
      booklist
    when 'Logout'
      login_prompt
    when 'Exit'
      goodbye
    end
  end

  # display
  def goodbye
    puts `clear`
    puts ascii.asciify('See you soon')
    puts ascii.asciify('Happy Reading!!')
  end

  # display
  def book_query_input
    logo_banner
    puts '---------Please enter a keyword to search for books ---------'
    book_query = gets.chomp
    if book_query == ''
      puts '🤔 Sorry didnt catch that'
      book_query_input
    else
      get_books_from_api(book_query)
    end
  end

  # display
  def booklist
    logo_banner
    user = User.find_by(username: @current_user)
    if user.books.empty?
      puts 'Your booklist is currently empty. 😩'
    else
      user.books.each { |book| puts "📚 '#{book.title}', written by #{book.author}, & published by #{book.publisher}"}
    end
    end_prompt_menu
  end

  # display
  def end_prompt_menu
    end_prompt = prompt.select(
      '',
      ['------ 📚 Add More Books 📚 ------', main]
    )
    if end_prompt == '------ 📚 Add More Books 📚 ------'
      book_query_input
    else
      menu_run
    end
  end

  # display
  def show_query_books(query_return)
    query_books = query_return.each_with_index.map do |book|
      "📚 '#{book[:title]}', written by #{book[:authors][0]}, & published by #{book[:publisher]}"
    end
    book_selection = prompt.select(
      'Please select a book to add to your reading list',
      query_books, main
    )
    if book_selection == main
      menu_run
    else
      save_user_book(book_selection, query_return)
    end
  end

  # display
  def main
    '------ 🔙 Return to Main Menu ------'
  end

  # logic
  def save_user_book(book_selection, query_return)
    index = @query_books.find_index(book_selection)
    @book_obj = query_return[index]
    @book = Book.find_or_create_by(title: @book_obj[:title], author: @book_obj[:authors][0], publisher: @book_obj[:publisher])
    UserBook.find_or_create_by(user_id: @user.id, book_id: @book.id)
    booklist
  end

  # display
  def prompt
    TTY::Prompt.new
  end

  # display
  def ascii
    Artii::Base.new
  end
end
