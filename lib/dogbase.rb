require "sqlite3"

module Doggies
  class Dogbase
    def initialize(db_name)
      @db = SQLite3::Database.new(db_name)
    end

    def create_schema
      @db.execute('
      CREATE TABLE dogs (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        description TEXT NULL
      );')
    end

    def create_dog(dog_name, dog_descr)
      @db.execute('
      INSERT INTO dogs (name, description)
      VALUES(?, ?)
      ;', dog_name, dog_descr)
    end

    def get_dogs
      @db.execute('
      SELECT name, description
      FROM dogs;')
    end
  end
end
