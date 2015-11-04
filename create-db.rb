require "./lib/dogbase"

db = Doggies::Dogbase.new("doggies.db")
db.create_schema
