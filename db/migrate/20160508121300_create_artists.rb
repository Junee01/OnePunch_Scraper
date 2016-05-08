class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :artist_name
      t.string :artist_same
      t.float :artist_score

      t.timestamps null: false
    end
  end
end
