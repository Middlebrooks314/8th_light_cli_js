class UserBook < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  def self.add_to_booklist(user_id, book_id)
    @list = UserBook.find_or_create_by(user_id: user_id, book_id: book_id)
  end
end
