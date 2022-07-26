require "json"
require "open-uri"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

# Movie.destroy_all # delete all movies
# puts "Deleting movies..."

url = "https://api.themoviedb.org/3/movie/top_rated?api_key=69b979f34e75fd34e143339b53dfa072"
movies_response = URI.open(url).read # open url
top_rated_movies = JSON.parse(movies_response) # hash
puts "Creating movies..."

# puts movies_response

top_rated_movies["results"].each do |movie|
  Movie.create(title: movie["title"], overview: movie["overview"], poster_url: movie["poster_path"], rating: ["vote_average"])
end

# Movie.create(poster_url: movie["poster_path"]) poster_url is db field (like in lines 9-12) and poster_path is hash key from API

puts "Created #{Movie.count} movies."
