require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require "pry"

# Load the file to connect to the DB
require_relative 'db/connection.rb'

# # Load specific routes / controllers
# require_relative 'controllers/artists.rb'
# require_relative 'controllers/songs.rb'

# Load models
require_relative 'models/pokemon'
# require_relative 'models/song'

get '/artists' do
  @artists = Artist.all
  erb :"artists/index"
end
              ################################################################_GIRO
              # ORDER COUNTS, THIS HAS TO BE IN FRONT OF THE post, create new
              # THAT YOU SEE DOWN AROUND LINE #37 BELOW
              # FOR SOME REASON I DIDNT UNDERSTAND
get '/artists/new' do
  @artists = Artist.all
  erb :"artists/new"
end           ################################################################_GIRO

              ################################################################_GIRO
              # DONT USE TRAILING SLASH, NO WORKEE
get '/artists/:id' do
  @artist = Artist.find(params[:id])
  # @artists = Artist.find(params[:id])
  erb :"artists/show"
end           ################################################################_GIRO


post '/artists' do
  @artist = Artist.create(:artist)  # THIS IS THE 'artist hash referred to at
                                    # https://github.com/ga-wdi-lessons/sinatra-and-activerecord
  # @artist = Artist.create(name: params[:name],   age:  params:[:age])
  redirect 'artists/#{@artist.id}'
end

put '/artists' do                   # THIS IS THE 'artist hash referred to at
  @artist = Artist.find(params[:id])
  @artist = Artist.update[:artist]  # THIS IS THE 'artist hash referred to at
                                    # https://github.com/ga-wdi-lessons/sinatra-and-activerecord
  redirect 'artists/#{@artist.id}'
end

delete '/artists/:id' do
  @artist = Artist.find(params[:id])
  @artist.destroy
  redirect("/artists")
end

puts "end of application"

binding.pry
