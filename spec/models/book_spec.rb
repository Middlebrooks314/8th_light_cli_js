require 'spec_helper'
require_relative 'book'

RSpec.describe Book do
  let(:attributes) {{
    title: 'We Love the Park',
    author: 'Stella Mae',
    publisher: 'Hime the Shar-Pei'
  }}
  it 'inherits from ActiveRecord::Base' do
    expect(Book.superclass).to eql(ActiveRecord::Base)
  end

  context 'Book.new' do
    let(:book) { Book.new }
    it 'has a title' do
      book.title = 'NASA Females'
      expect(book.title).to eql('NASA Females')
    end

    it 'has an author' do
      book.author = 'Sally Ride'
      expect(book.author).to eql('Sally Ride')
    end

    it 'has a publisher' do
      book.publisher = 'Mae C. Jemison'
      expect(book.publisher).to eql('Mae C. Jemison')
    end
  end

  describe '.new_book' do
    it 'creates a new book object' do
      expect(subject.new_book(book_obj)).to eql(Book.new)
    end
  end
end
