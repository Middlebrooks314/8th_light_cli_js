class CommandLine

  def run
    welcome
  end

  def welcome
    clear_screen
    puts ascii.asciify('Welcome to Bookshelf!')
    login_prompt
  end

  def login_prompt
    puts 'Please enter your username'
    username = gets.chomp
    if username == ''
      puts '🤔 Blank Spaces? Are you a Taylor Swift fan?'
      login_prompt
    else
      @user = User.login_user(username)
    end
    menu_run
  end

  def logo_banner
    clear_screen
    puts ascii.asciify('Bookshelf')
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
      book_query_input
    when 'View your booklist'
      booklist
    when 'Logout'
      login_prompt
    when 'Exit'
      goodbye
    end
  end

  def goodbye
    clear_screen
    puts ascii.asciify('Happy Reading!!')
  end

  def book_query_input
    logo_banner
    puts '---------Please enter a keyword to search for books ---------'
    book_query = gets.chomp
    user_query_input(book_query)
  end

  def booklist
    logo_banner
    User.user_booklist(@user.username)
    end_prompt_menu
  end

  def end_prompt_menu
    end_prompt = prompt.select(
      '',
      ['------ 📚 Add More Books 📚 ------', return_to_main_menu]
    )
    if end_prompt == '------ 📚 Add More Books 📚 ------'
      book_query_input
    else
      menu_run
    end
  end

  def select_book(query_books, query_return)
    book_selection = prompt.select(
      'Please select a book to add to your reading list',
      query_books, return_to_main_menu
    )
    if book_selection == return_to_main_menu
      menu_run
    else
      index = query_books.find_index(book_selection)
      save_user_book(query_return[index])
    end
  end

  def return_to_main_menu
    '------ 🔙 Return to Main Menu ------'
  end

  def save_user_book(book_obj)
    @book = Book.new_book(book_obj)
    UserBook.add_to_booklist(@user.id, @book.id)
    booklist
  end

  def clear_screen
    puts `clear`
  end

  def prompt
    TTY::Prompt.new
  end

  def ascii
    Artii::Base.new
  end
end
