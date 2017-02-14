require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require "pry"

# Load the file to connect to the DB
require_relative 'db/connection.rb'

# # Load specific routes / controllers
# require_relative 'controllers/pokemon.rb'
# require_relative 'controllers/songs.rb'

# Load models
require_relative 'models/pokemon'
# require_relative 'models/song'

get '/pokemon' do
  @pokemon = Pokemon.all
  erb :"pokemon/index"
end
              ################################################################_GIRO
              # ORDER COUNTS, THIS HAS TO BE IN FRONT OF THE post, create new
              # THAT YOU SEE DOWN AROUND LINE #37 BELOW
              # FOR SOME REASON I DIDNT UNDERSTAND
get '/pokemon/new' do
  @pokemon = Pokemon.all
  erb :"pokemon/new"
end           ################################################################_GIRO

              ################################################################_GIRO
              # DONT USE TRAILING SLASH, NO WORKEE
get '/pokemon/:id' do
  @artist = Pokemon.find(params[:id])
  # @pokemon = Pokemon.find(params[:id])
  erb :"pokemon/show"
end           ################################################################_GIRO


# post '/pokemon' do
#   @artist = Pokemon.create(:artist)  # THIS IS THE 'artist hash referred to at
#                                     # https://github.com/ga-wdi-lessons/sinatra-and-activerecord
#   # @artist = Pokemon.create(name: params[:name],   age:  params:[:age])
#   redirect 'pokemon/#{@artist.id}'
# end
#
# put '/pokemon' do                   # THIS IS THE 'artist hash referred to at
#   @artist = Pokemon.find(params[:id])
#   @artist = Pokemon.update[:artist]  # THIS IS THE 'artist hash referred to at
#                                     # https://github.com/ga-wdi-lessons/sinatra-and-activerecord
#   redirect 'pokemon/#{@artist.id}'
# end
#
# delete '/pokemon/:id' do
#   @artist = Pokemon.find(params[:id])
#   @artist.destroy
#   redirect("/pokemon")
# end

puts "end of application"

# binding.pry
