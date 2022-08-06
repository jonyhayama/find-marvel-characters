class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :thumbnail_url
      t.string :external_id

      t.index :external_id, unique: true

      t.timestamps
    end
  end
end
