require 'rest-client'
require 'json'
require 'pry'


BASE_URL = 'https://www.googleapis.com/books/v1/volumes?q='


def get_books_from_api(book_query)
    p '---------------- getting some bookkkssss------------'
    # p book_query
    response_string = RestClient.get("#{BASE_URL}#{book_query}&key#{ENV["BOOKS_API_KEY"]}")
    # p response_string
    response_hash = JSON.parse(response_string)
    show_query_books(response_hash)
end 


def show_query_books(response_hash)
    # titles = []
    # response_hash.map{ |category| titles << category}
    titles = response_hash["items"].map { |item| item["volumeInfo"]["title"] }
    p titles 
    publishers = response_hash["items"].map { |item| item["volumeInfo"]["publisher"]}
    p publishers
    authors = response_hash["items"].map { |item| item["volumeInfo"]["authors"]}
    p authors 


    ################### create new objects from the parsed hash data ############


    
    # title = ["items"][0]["volumeInfo"]["title"]
    # publishers = ["items"][0]["volumeInfo"]["publishers"]
    # authors = ["items"][0]["volumeInfo"]["authors"]
end 