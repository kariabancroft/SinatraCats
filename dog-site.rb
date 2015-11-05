require "sinatra"
require "./lib/doggies"
require "./lib/dogbase"
require "pry"

class DogSite < Sinatra::Base

  def current_db
    @curr_db ||= Doggies::Dogbase.new("doggies.db")
  end

  get "/" do
    @dogs = current_db.get_dogs
    erb :index
  end

  get "/dog" do
    # This will match first against /dog
    erb "Dog string"
  end

  get "/new" do
    erb :new
  end

  post "/new" do
    binding.pry
    @new_name = params[:name]
    @descr = params[:description]
    current_db.create_dog(@new_name, @descr)
    erb :new
  end

  get "/:dog_name" do
    # This will now never match against /dog
    erb "String"
  end

  get "/dog/:dog_name" do
    dog_name = params[:dog_name]
    @dog = Doggies::Dog.new(dog_name)
    erb :detail
  end

  get "/cat/:cat/:name/:id" do
    erb params
    # SOME CODE HERE
    # /cat/grumpy/grumpy/2
    # NO MATCH: /cat/grumpy
  end
end
