class CreateUserBooks < ActiveRecord::Migration[5.2]
    def change
      create_table :user_books do |t|
        t.integer :book_id
        t.integer :user_id
      end
    end
  end