class CommandLineInterface 
    
    def run 
        self.welcome
        # self.login
        book_query = get_book_query_from_user
        book_hash = get_books_from_api(book_query)
        display_books(book_hash)
    end 

    def welcome 
        puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"
        puts "Welcome to BookShelf! Happy Reading!"
        puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"
        # self.login
    end 

    # def login 
    #     puts "Please enter your username"
    #     username = gets.chomp
    #     @user = User.find_or_create_by(username: username)
    #     self.printing 
    # end 

    # def printing 
    #     puts "--------------Hello there #{@user.username}--------------"
        
    # end 

    def get_book_query_from_user
        puts "---------Please enter a keyword to search for books ---------"
        gets.chomp
    end 

    def display_books(book_hash)
        book_hash.each.with_index(1) do |data, index|
          puts "#{index}. " + data['title']
        end
      end
end 