class CommandLineInterface 
    
    def run 
        self.welcome
        self.login
    end 

    def welcome 
        puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"
        puts "Welcome to BookShelf! Happy Reading!"
        puts "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"
        self.login
    end 

    def login 
        puts "Please enter your username"
        username = gets.chomp
        @user = User.find_or_create_by(username: username)
        self.printing 
    end 

    def printing 
        puts "--------------Hello there #{@user.username}--------------"   
    end 
end 