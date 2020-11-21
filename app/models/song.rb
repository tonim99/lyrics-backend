class Song < ApplicationRecord
    has_many :users
    has_many :setlists, through: :users
end
