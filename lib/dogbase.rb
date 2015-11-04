require "sqlite3"

module Doggies
  class Dogbase
    def current_db
      @db ||= SQLite3::Database.new("doggies.db")
    end

    def create_schema
      current_db.execute('
      CREATE TABLE dogs (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        description TEXT NULL
      );')
    end

    def create_dog(dog_name, dog_descr)
      current_db.execute('
      INSERT INTO dogs (name, description)
      VALUES(?, ?)
      ;', dog_name, dog_descr)
    end
  end
end
