class Setlist < ApplicationRecord
  has_many :users
  has_many :songs, through: :users
end
