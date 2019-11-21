

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
            p "🤔 Blank Spaces? Are you a Taylor Swift fan?"
            self.login
        else 
            @user = User.find_or_create_by(username: username)
            @current_user = @user.username
            sleep(1)
            puts `clear`
            self.personal_welcome 
        end 
    end 

    def logo_banner
        puts ascii.asciify("BookShelf")
    end 

    def personal_welcome
        puts ascii.asciify("Hello #{@user.username}")
        # p @current_user
        self.menu_run
    end 

    def main_menu
        puts `clear`
        puts self.logo_banner
        puts "--------Main Menu---------"
        prompt.select(
            "Please select an option", 
            ["Search for books", 
            "View your bookshelf", 
            "Logout", "Exit"]
        )
    end 
    
    def menu_run
        menu_choice = self.main_menu
        case menu_choice
        when "Search for books"
            self.get_book_query_from_user
        when "View your bookshelf"
            self.bookshelf(@user.books)
        when "Logout"
            self.login
        when "Exit"
            self.goodbye
        end 
    end 

    def goodbye
        puts `clear`
        puts ascii.asciify("See you soon")
        puts ascii.asciify("Happy Reading!!")
    end 

    def get_book_query_from_user
        puts `clear`
        puts self.logo_banner
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

    def bookshelf(books)
        puts `clear`
        puts self.logo_banner
       
        # if @user.books = []
        #     p "You dont have any books yet."
        # end 
        # byebug
       books.map {|book| p book["book"]}
        end_prompt = prompt.select(
            "",
            ["------ 📚 Add More Books 📚 ------",
             "------ 🔙 Return to Main Menu ------"]
            )
        
        if end_prompt == ("------ 📚 Add More Books 📚 ------")
            self.get_book_query_from_user
        else
            self.menu_run 
        end
    end 

    def show_query_books(query_return)
        books = query_return.each_with_index.map do |book, index| 
            "📚 '#{book[:title]}', written by #{book[:authors][0]}, & published by #{book[:publisher]}"
        end 
        
        book_selection = prompt.select(
            "Please select a book to add to your reading list",
             books, 
             "------ 🔙 Return to Main Menu ------")
        
        if (book_selection == "------ 🔙 Return to Main Menu ------")
            self.menu_run
        else
            @book = Book.find_or_create_by(book: book_selection, user_id: @user.id)
            @user.books << @book
            self.book_added
        end 
       
    end 

    def book_added
        puts ascii.asciify("Book Added 👍👍👍👍👍👍👍👍👍")
        self.bookshelf(@user.books)
    end 
    def book_list_loading
        puts "Loading.................."
    end 


    def prompt
        TTY::Prompt.new
    end 

    def ascii
        Artii::Base.new
    end
end 