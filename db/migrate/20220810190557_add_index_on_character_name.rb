class AddIndexOnCharacterName < ActiveRecord::Migration[7.0]
  def up
    execute "CREATE INDEX index_characters_lower_name ON characters USING gin (lower(name) gin_trgm_ops);"
  end

  def down
    execute "DROP INDEX index_characters_lower_name;"
  end
end
