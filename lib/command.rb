

class CommandLineInterface 
    
    def run 
        self.welcome
    end 

    def welcome 
        puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"
        puts ascii.asciify("Welcome to BookShelf!")
        puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"
        self.login
    end 

    def login 
        puts "Please enter your username"
        username = gets.chomp
        @user = User.find_or_create_by(username: username)
        sleep(1)
        puts `clear`
        self.personal_welcome 
    end 

    def personal_welcome
        puts ascii.asciify("Hello #{@user.username}")
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
        gets.chomp
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