class Book < ActiveRecord::Base
    has_many :lists
    has_many :users, through: :lists



end 

#BOOKS_API_KEY is an environment variable.. to access it 

# API_KEY = ENV["BOOKS_API_KEY"]
#export BOOKS_API_KEY="obtain from google books API key" inside the terminal