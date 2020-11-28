class Setlist < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :songs
  # has_many :songs
end
