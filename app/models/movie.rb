class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end


# Un film doit avoir un titre unique et un aperçu.
# Un film a plusieurs signets

