# Bookshelf

![https://giphy.com/gifs/YOXyuwyQkLahvXO2Yu]

Bookshelf is a simple book list application that allows users to search for a topics to get a list of books that they can subsequently add to their reading list. The Google Books API is used to return the list of books related to the user's search query.

## Installation

1. Bookshelf is a CLI application. You will need to open a command line. 
2. Obtain a Google Books API key from https://developers.google.com/books/docs/v1/getting_started
3. In the root directory of this repository, create a `.env` file and add `export BOOKS_API_KEY=<YOUR GOOGLE BOOKS API KEY HERE>`
4. Run ```bundle install``` in your terminal
5. Run ```ruby bin/run.rb``` in your terminal to start the application.


## Usage

```
1. User can login/signup
2. User can search books 
3. User can see a list of books returned from the search query
4. User can add books to their booklist from the returned search query
5. User can view their booklist

```
## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.


