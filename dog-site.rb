require "sinatra"
require "./lib/doggies"

class DogSite < Sinatra::Base
  get "/" do
    @dogs = Doggies::Dog.all
    erb :index
  end

  get "/dog" do
    # This will match first against /dog
    erb "Dog string"
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
