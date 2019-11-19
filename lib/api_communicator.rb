require 'rest-client'
require 'json'
require 'pry'

api_key = ENV["BOOKS_API_KEY"]
# google_books_api = 'https://www.googleapis.com/books/v1/volumes?q='
#searchTerm&key=apikey

def show_query_books
    books_array = get_books_from_api(query_input)
end 

def get_books_from_api(book_query)
    p '---------------- getting some bookkkssss------------'
    response_string = RestClient.get("https://www.googleapis.com/books/v1/volumes?q=#{book_query}#{api_key}")
    response_hash = JSON.parse(all_books)
end 