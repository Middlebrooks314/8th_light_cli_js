require 'rest-client'
require 'json'
require 'pry'


BASE_URL = 'https://www.googleapis.com/books/v1/volumes?q='

def show_query_books
    books_array = get_books_from_api(query_input)
end 

def get_books_from_api(book_query)
    p '---------------- getting some bookkkssss------------'
    p book_query
    response_string = RestClient.get("#{BASE_URL}#{book_query}&key#{ENV["BOOKS_API_KEY"]}")
    p response_string
    response_hash = JSON.parse(response_string)
    p response_hash
end 