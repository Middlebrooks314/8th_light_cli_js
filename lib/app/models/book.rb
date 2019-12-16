class Book < ActiveRecord::Base
  has_many :user_books
  has_many :users, through: :user_books

  def self.new_book(book_obj)
    Book.find_or_create_by(title: book_obj[:title], author: book_obj[:authors].join(', '), publisher: book_obj[:publisher])
  end
end
