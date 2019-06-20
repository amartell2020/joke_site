require "sinatra"
require "chuck_norris"
require "pry"
require "rest-client"

jk = ChuckNorris::JokeFinder.get_joke
get "/" do
  erb :home
end

get "/help" do
  erb :help
end

get "/random" do
  @joke = jk.joke
  erb :random
end

get "/search" do
  erb :search
end

get "/results" do
  name_joke = ChuckNorris::JokeFinder.get_joke(first_name: params[:first_name], last_name: params[:last_name])
  @name_joke = name_joke.joke
  # @first_name = params[:first_name]
  # @last_name = params[:last_name]
  erb :results
end
