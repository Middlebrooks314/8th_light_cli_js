require 'rest-client'
require 'json'
require 'pry'
BASE_URL = 'https://www.googleapis.com/books/v1/volumes?q='

#sends GET request to API and parses the JSON
  def get_books_from_api(book_query)
    response_string = RestClient.get("#{BASE_URL}#{book_query}&key#{ENV['BOOKS_API_KEY']}")
    response_hash = JSON.parse(response_string)
    parse_query_books(response_hash)
  end

  # iterates through the nested hash to return the first 5 books with the title, author,
# and publisher attributes
  def parse_query_books(response_hash)
    books = response_hash['items'].map {|item|
      {
        :title => item.dig('volumeInfo', 'title') || '',
        :authors => item.dig('volumeInfo', 'authors') || ['unavailable'],
        :publisher => item.dig('volumeInfo', 'publisher') || 'unavailable'
      }
    }
    query_return = books[0..4]
    show_query_books(query_return)
  end
