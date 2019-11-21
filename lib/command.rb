

class CommandLineInterface 
    
    def run 
        self.welcome
    end 
    
    def welcome 
        puts `clear`
        puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"
        puts ascii.asciify("Welcome to BookShelf!")
        puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"
        self.login
    end 

    def login 
        puts "Please enter your username"
        username = gets.chomp
        if (username == "")
            p "🤔 Sorry didnt catch that"
            self.login
        else 
            @user = User.find_or_create_by(username: username)
            @current_user = @user.username
            sleep(1)
            puts `clear`
            self.personal_welcome 
        end 
    end 

    def personal_welcome
        puts ascii.asciify("Hello #{@user.username}")
        # p @current_user
        self.menu_run
    end 

    def main_menu
        puts "--------Main Menu---------"
        prompt.select("Please select an option", ["Search for books", "View your bookshelf", "Logout"])
    end 
    
    def menu_run
        menu_choice = self.main_menu
        case menu_choice
        when "Search for books"
            self.get_book_query_from_user
        when "View your bookshelf"
            p "------at that list you havent made yet"
        when "Logout"
            self.goodbye
        end 
    end 

    def goodbye
        puts `clear`
        puts ascii.asciify("See you soon")
        puts ascii.asciify("Happy Reading!!")
    end 

    def get_book_query_from_user
        puts "---------Please enter a keyword to search for books ---------"
        book_query = gets.chomp
        if (book_query == "")
            p "🤔 Sorry didnt catch that"
            self.get_book_query_from_user
        else 
            p "Searching...."
            sleep(1)
            get_books_from_api(book_query)
        end 
    end 

    def display_books(book_hash)
        book_hash.each.with_index(1) do |data, index|
          puts "#{index}. " + data['title']
        end
    end

    def prompt
        TTY::Prompt.new
    end 

    def ascii
        Artii::Base.new
    end

    
end 