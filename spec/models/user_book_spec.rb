require 'spec_helper'
require_relative 'user_book'

  RSpec.describe UserBook do
  let(:attributes) {{
    book_id: 2,
    user_id: 1
}}
  it 'inherits from ActiveRecord::Base' do
    expect(UserBook.superclass).to eql(ActiveRecord::Base)
  end
end

  describe '.add_to_booklist' do
    it 'adds book to user/s list by creating new User_Book instance' do
      user_id = double('user_id')
      book_id = double('book_id')
      expect(subject.add_to_booklist(user_id, book_id)).to eql(subject.new)
    end
end
