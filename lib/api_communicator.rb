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
    parse_query_books(response_hash)

    
end 


def parse_query_books(response_hash)
    # byebug
    books = response_hash["items"].map { |item| 
        {
            :title => item.dig("volumeInfo", "title") || "",
            :authors => item.dig("volumeInfo", "authors") || [],
            :publisher => item.dig("volumeInfo", "publisher") || ""
        }
    }
    # byebug
    query_return = books[0..4]
    show_query_books(query_return)
    
end 


def show_query_books(query_return)
    # byebug
    books = query_return.each_with_index.map do |book, index| "#{index + 1}. \"#{book[:title]}\" by #{book[:authors][0]}, published by #{book[:publisher]} "
    end 
    prompt.select("Please select a book to add to your reading list", books)
    

end 



# byebug
    # p books.each do {|book| puts book[:title]}
    # end 




# books = response_hash["items"].map { |item| 
#     {
#         :title => item.dig("volumeInfo", "title") || "",
#         :publisher => item.dig("volumeInfo", "publisher") || "",
#         :authors => item.dig("volumeInfo", "authors") || []
#     }
# }

# books = response_hash["items"].map { |item| 
#     [
#         item.dig("volumeInfo", "title"),
#         item.dig("volumeInfo", "publisher"),
#         item.dig("volumeInfo", "authors")
#     ]
# }
# books.each.with_index(1) do |data, index|
#     puts "#{index} " + data['title']
#   end