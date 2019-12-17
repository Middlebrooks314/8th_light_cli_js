require 'spec_helper'
require 'command_line'

RSpec.describe CommandLine do
  subject { CommandLine.new }


  describe '#welcome' do
    it 'prints welcome message to screen' do
      expect(subject.welcome).to_eql('        Welcome to Bookshelf.... a place to save your reading list.       ')
    end
  end

  describe '#login_prompt' do
    it 'asks user for username' do
      expect(subject.login_prompt).to_eql('Please enter your username')
    end
  end

  describe '#logo_banner' do
    it 'prints Booklist title' do
      expect(subject.logo_banner).to_eql('📚🐛 Bookshelf 📚🐛')
    end
  end

  describe '#main_menu' do
    it 'prints menu options for user to select from' do
      expect(subject.main_menu).to eql(prompt.select)
    end
  end

  describe '#menu_run' do
    it 'case statement to run selected user prompt' do
      expect(subject.menu_run).not_to be_nil
    end
  end

  describe '#goodbye' do
    it 'prints goodbye message to user' do
      expect(subject.goodbye).to eql('Happy Reading!! 📖 😊')
    end
  end

  describe '#book_query_input' do
    it 'takes in a user search query string' do
      expect(subject.book_query_input).to eql('---------Please enter a keyword to search for books ---------')
    end
  end

  describe '#booklist' do
    it 'prints user booklist' do
      expect(subject.booklist).to eql(User.books)
    end
  end

  describe '#select_book' do
    it 'shows user 5 query returns to choose from' do
      query_books = double('query_books')
      query_return = double('query_return')
      expect(subject.select_book(query_books, query_return)).not_to be_nil
    end
  end

  describe '#return_to_main_menu' do
    it 'prints return to main menu' do
      expect(subject.return_to_main_menu).to eql('------ 🔙 Return to Main Menu ------')
    end
  end

  describe '#save_user_book' do
    it 'saves book to book class and saves book with user id to user_book class' do
      book_obj = double('book_obj')
      expect(subject.save_user_book(book_obj)).to eql(UserBook.new)
    end
  end
end
