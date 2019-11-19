class User < ActiveRecord::Base
    has_one :list
    has_many :books, through: :list
end 