module Doggies

  class Dog
    attr_reader :name

    DOG_NAMES = ["Scooby", "Toast", "Muppet", "Pickles", "Oliver", "Clifford"]

    def initialize(name)
      @name = name
    end

    def self.all
      all_dogs = []
      DOG_NAMES.each do |dog_name|
        puppy = Doggies::Dog.new(dog_name)
        all_dogs.push(puppy)
      end

      return all_dogs
    end
  end
end
