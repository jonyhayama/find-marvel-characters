require 'csv'

characters = []

CSV.read('db/marvel-characters.csv').each do |character|
  characters << {
    external_id: character[0].strip,
    name: character[1].strip,
    thumbnail_url: character[2].strip,
  }
end

Character.upsert_all(characters, unique_by: :external_id)