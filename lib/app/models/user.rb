class User < ActiveRecord::Base
  has_many :user_books
  has_many :books, through: :user_books

  def self.login_user(username)
    @user = User.find_or_create_by(username: username)
  end

  def self.user_booklist
    if @user.books.empty?
      puts 'Your booklist is currently empty. 😩'
    else
      @user.books.each { |book| puts "📚 '#{book.title}', written by #{book.author}, & published by #{book.publisher}"}
    end
  end
end
