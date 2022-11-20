# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

Movie.destroy_all

30.times do |movie|
  Movie.create(title: Faker::Movie.title,
                overview: Faker::Quote.yoda,
                poster_url: Faker::LoremFlickr.image(size: "90x110", search_terms: ['movies']),
                rating: Faker::Number.between(from: 1, to: 5))
end
